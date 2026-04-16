import os
import re
import sys

def sync_version():
    target_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    os.chdir(target_dir)
    
    conf_path = 'tools/release.conf'
    if not os.path.exists(conf_path):
        print(f"Error: {conf_path} not found")
        sys.exit(1)

    # 1. Read config
    with open(conf_path, 'r', encoding='utf-8') as f:
        content = f.read()
        v_match = re.search(r'RELEASE_BASE_VERSION=(v[\d\.]+)', content)
        c_match = re.search(r'RELEASE_VERSION_CODE=(\d+)', content)
        
        if not v_match or not c_match:
            print("Error: Could not find version info in release.conf")
            sys.exit(1)
            
        version = v_match.group(1)
        v_code = c_match.group(1)
        v_code_hex = hex(int(v_code))

    print(f"Syncing version: {version} (Code: {v_code}, Hex: {v_code_hex})")

    # 2. Update apktool.yml
    update_file('apktool.yml', 
                [r'versionCode: \d+', r'versionName: v[\d\.]+'],
                [f'versionCode: {v_code}', f'versionName: {version}'])

    # 3. Update strings.xml (main)
    update_file('res/values/strings.xml',
                [r'<string name="more_current_version_txt">v[\d\.]+</string>'],
                [f'<string name="more_current_version_txt">{version}</string>'])

    # 4. Update BuildConfig.smali (Main app)
    update_file('smali/com/smartisanos/home/BuildConfig.smali',
                [r'VERSION_CODE:I = 0x[0-9a-fA-F]+', r'VERSION_NAME:Ljava/lang/String; = "v[\d\.]+"'],
                [f'VERSION_CODE:I = {v_code_hex}', f'VERSION_NAME:Ljava/lang/String; = "{version}"'])

    # 5. Update ThemeItemActivity$7.smali (HTML message)
    # Using simple replace for smali to avoid regex escape issues
    # The search string contains unicode escape sequence \u9524...
    update_file_simple('smali/com/smartisanos/launcher/theme/ThemeItemActivity$7.smali',
                ['v1.5.1', 'v1.5.2', 'v1.5.3'], # Search all possible old versions
                f'{version}')

    # 6. Update CHANGELOG.md (Top header)
    update_file('CHANGELOG.md',
                [r'## \u66f4\u65b0\u5185\u5bb9 \(v?[\d\.-]+\)'],
                [f'## 更新内容 ({version})'])

    # 7. Update README.md
    update_file('README.md',
                [r'v1\.5\.[1-9](-r\d+)?'],
                [version])

    print("✓ All files synchronized successfully.")

def update_file(path, patterns, replacements):
    if not os.path.exists(path):
        print(f"  - Warning: {path} not found, skipping.")
        return
    with open(path, 'r', encoding='utf-8') as f:
        content = f.read()
    original_content = content
    for p, r in zip(patterns, replacements):
        content = re.sub(p, r, content)
    if content != original_content:
        with open(path, 'w', encoding='utf-8', newline='\n') as f:
            f.write(content)
        print(f"  - Updated: {path}")
    else:
        print(f"  - No change needed: {path}")

def update_file_simple(path, search_list, replacement):
    if not os.path.exists(path):
        print(f"  - Warning: {path} not found, skipping.")
        return
    with open(path, 'r', encoding='utf-8') as f:
        content = f.read()
    original_content = content
    for search in search_list:
        content = content.replace(search, replacement)
    if content != original_content:
        with open(path, 'w', encoding='utf-8', newline='\n') as f:
            f.write(content)
        print(f"  - Updated: {path}")
    else:
        print(f"  - No change needed: {path}")

if __name__ == '__main__':
    sync_version()
