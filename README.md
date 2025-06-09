# xlion-repo-test-archive-keyring
Testing repo for archive-keyring creation and rotating

## Attestation

```sh
gh attestation verify --owner xlionjuan --predicate-type 'https://in-toto.io/attestation/release' xlion-repo-test-archive-keyring*
```

## Install

One line install command, `jq` is required.

```sh
sudo apt-get update && sudo apt-get install -y jq && url=$(curl -s https://api.github.com/repos/xlionjuan/xlion-repo-test-archive-keyring/releases/latest | jq -r '.assets[] | select(.name | endswith(".deb")) | .browser_download_url') && tmpfile="/tmp/$(basename "$url")" && curl -L "$url" -o "$tmpfile" && sudo dpkg -i "$tmpfile"
```