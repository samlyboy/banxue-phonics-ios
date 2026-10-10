#!/usr/bin/env bash
set -e
cd "$(dirname "$0")/.."

APP="build/App.xcarchive/Products/Applications/App.app"
[ -d "$APP" ] || { echo "App.app not found at $APP"; exit 1; }

# 用 ldid 给包内所有 Mach-O 二进制打 fake 签名（免 Apple 证书，TrollStore 装时保留）
# 真机 arm64 包必须经过此步，否则零签名无法安装
find "$APP" -type f -exec sh -c 'file "$1" 2>/dev/null | grep -q "Mach-O" && ldid -S "$1"' _ {} \;

# 打包成 IPA
rm -rf Payload banxue-phonics.ipa
mkdir -p Payload
cp -R "$APP" Payload/
zip -r banxue-phonics.ipa Payload >/dev/null

echo "=== built: $(du -h banxue-phonics.ipa | cut -f1) ==="
