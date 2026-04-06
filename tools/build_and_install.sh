#!/bin/sh
set -eu

script_dir=$(CDPATH= cd -- "$(dirname "$0")" && pwd)
repo_root=$(CDPATH= cd -- "$script_dir/.." && pwd)
build_dir="$repo_root/build"
unsigned_apk="$build_dir/smartisan-launcher-debug-unsigned.apk"
signed_apk="$build_dir/smartisan-launcher-debug-signed.apk"
keystore_dir="$build_dir/signing"
keystore_path="$keystore_dir/debug.keystore"

need_cmd() {
  command -v "$1" >/dev/null 2>&1 || {
    echo "missing required command: $1" >&2
    exit 1
  }
}

find_adb() {
  if command -v adb >/dev/null 2>&1; then
    command -v adb
    return 0
  fi

  for sdk_root in \
    "${ANDROID_HOME:-}" \
    "${ANDROID_SDK_ROOT:-}" \
    "$repo_root/.local/android-sdk" \
    "$HOME/Library/Android/sdk" \
    "$HOME/Android/Sdk"
  do
    [ -n "$sdk_root" ] || continue
    adb_bin="$sdk_root/platform-tools/adb"
    if [ -x "$adb_bin" ]; then
      printf '%s\n' "$adb_bin"
      return 0
    fi
  done

  return 1
}

build_apk() {
  mkdir -p "$build_dir"
  rm -f "$unsigned_apk" "$signed_apk"
  apktool b "$repo_root" -o "$unsigned_apk"
}

ensure_keystore() {
  mkdir -p "$keystore_dir"
  if [ ! -f "$keystore_path" ]; then
    keytool -genkeypair \
      -keystore "$keystore_path" \
      -storepass android \
      -keypass android \
      -alias androiddebugkey \
      -dname "CN=Android Debug,O=Android,C=US" \
      -keyalg RSA \
      -keysize 2048 \
      -validity 10000 >/dev/null
  fi
}

sign_apk() {
  cp "$unsigned_apk" "$signed_apk"
  jarsigner \
    -keystore "$keystore_path" \
    -storepass android \
    -keypass android \
    "$signed_apk" \
    androiddebugkey >/dev/null
  jarsigner -verify "$signed_apk" >/dev/null
}

select_device() {
  adb_bin="$1"

  if [ -n "${ANDROID_SERIAL:-}" ]; then
    printf '%s\n' "$ANDROID_SERIAL"
    return 0
  fi

  devices=$("$adb_bin" devices | awk 'NR>1 && $2=="device" {print $1}')
  count=$(printf '%s\n' "$devices" | sed '/^$/d' | wc -l | tr -d ' ')

  if [ "$count" -eq 0 ]; then
    return 1
  fi

  if [ "$count" -gt 1 ]; then
    echo "multiple adb devices detected; set ANDROID_SERIAL to choose one" >&2
    exit 1
  fi

  printf '%s\n' "$devices" | sed '/^$/d'
}

install_apk() {
  if ! adb_bin=$(find_adb); then
    echo "adb not found, skipped install"
    return 0
  fi

  if ! device_serial=$(select_device "$adb_bin"); then
    echo "no adb device detected, skipped install"
    return 0
  fi

  if [ -n "${ANDROID_SERIAL:-}" ]; then
    "$adb_bin" -s "$device_serial" install -r "$signed_apk"
  else
    "$adb_bin" install -r "$signed_apk"
  fi

  echo "adb install -r succeeded"
}

need_cmd apktool
need_cmd keytool
need_cmd jarsigner

build_apk
ensure_keystore
sign_apk

echo "signed apk: $signed_apk"
install_apk
