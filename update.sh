#!/usr/bin/env bash
set -euo pipefail

VERSION="${1:?Usage: update.sh <version>}"

echo "Fetching digests for v${VERSION}..."
digests=$(curl -sfL "https://api.github.com/repos/weedonandscott/trolley/releases/tags/v${VERSION}" \
  | jq -r '.assets[] | select(.name | startswith("trolley-cli-")) | "\(.name)=\(.digest | ltrimstr("sha256:"))"')

if [ -z "$digests" ]; then
  echo "Error: no CLI assets found for v${VERSION}" >&2
  exit 1
fi

digest() {
  local hash
  hash=$(echo "$digests" | grep "^$1=" | cut -d= -f2)
  if [ -z "$hash" ]; then
    echo "Error: no digest found for $1" >&2
    exit 1
  fi
  echo "$hash"
}

echo "Digests:"
echo "$digests"

sed -i "s/version \".*\"/version \"$VERSION\"/" Formula/trolley.rb
sed -i "/aarch64-macos/{n;s/sha256 \".*\"/sha256 \"$(digest trolley-cli-aarch64-macos.tar.xz)\"/}" Formula/trolley.rb
sed -i "/x86_64-macos/{n;s/sha256 \".*\"/sha256 \"$(digest trolley-cli-x86_64-macos.tar.xz)\"/}" Formula/trolley.rb
sed -i "/aarch64-linux/{n;s/sha256 \".*\"/sha256 \"$(digest trolley-cli-aarch64-linux.tar.xz)\"/}" Formula/trolley.rb
sed -i "/x86_64-linux/{n;s/sha256 \".*\"/sha256 \"$(digest trolley-cli-x86_64-linux.tar.xz)\"/}" Formula/trolley.rb

echo "Updated Formula/trolley.rb to v${VERSION}"

git add Formula/trolley.rb
git commit -m "trolley $VERSION"
echo "Committed."
