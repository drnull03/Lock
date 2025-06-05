# Lock

Lock is a minimal Bash-based encryption utility for securely encrypting files and directories using OpenSSL. It is designed to be lightweight, portable, and compatible with environments that only include basic Unix tools.

---


## Requirements

The following tools must be installed on your system:

- `awk`
- `openssl`
- `tar`

These are typically included in most Unix/Linux distributions. The `install.sh` script will check for them and notify you if any are missing.

---

## Installation

To install the `lock` and `unlock` scripts system-wide:

1. Open a terminal and navigate to the directory containing the scripts.
2. Run the install script:

```bash
chmod +x install.sh
./install.sh
```
---

## To Uninstall

To uninstall the `lock` and `unlock` scripts system-wide:

1. Open a terminal and navigate to the directory containing the scripts.
2. Run the uninstall script:

```bash
chmod +x uninstall.sh
./uninstall.sh
```

---

# Usage

To use lock 

```lock path/to/plain-file```

To use unlock

```unlock path/to/encrypted-file```

---
