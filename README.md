# User Delete Script

**(c) J~Net 2026**
Simple, safe Linux user search and deletion tool with optional home directory removal.

https://github.com/jamieduk/delete-user
---

## Overview

This script allows you to:

* Search for Linux users by name (partial or full match)
* Display detailed user information
* Show associated home directory (if valid)
* Safely delete the user
* Optionally remove the user's home folder (only if safe)

Designed to avoid dangerous deletions and ensure clear confirmation before any destructive action.

---

## Features

* Case-insensitive user search
* Lists all non-root users (excluding current user)
* Displays:

  * UID / GID
  * Home directory
  * Shell
  * Groups
* Detects valid home directories
* Prevents unsafe folder deletion
* Requires **double confirmation** before deletion
* Bright green terminal output for visibility

---

## Safety Protections

This script includes strict safeguards:

* Only deletes home directories matching:

  ```
  /home/<username>
  ```
* Will **NOT delete**:

  * `/root`
  * `/`
  * Custom or unexpected paths
  * Other users’ directories
* Will still allow deleting the user account even if no valid home exists
* Requires:

  * `YES` confirmation
  * then `DELETE` confirmation

---

## Requirements

* Linux system
* Bash
* `getent`, `userdel`, `groups`, `du`
* `sudo` privileges (for deletion)

---

## Installation

```bash
gedit ./delete-user
```

Paste the script, save, then:

```bash
chmod +x delete-user install.sh
```

(Optional) Copy to system path:

```bash
sudo cp delete-user /usr/local/bin/delete-user

or

./install.sh delete-user
```

---

## Usage

### Run interactively:

```bash
./delete-user
```

You will be prompted to enter a username.

---

### Run with argument:

```bash
./delete-user username
```

Example:

```bash
./delete-user zoe
```

---

## Example Flow

```
Enter username to search: zoe

User found: zoe
UID: 1016
GID: 1016
Home: /home/zoe
Shell: /usr/sbin/nologin

No safe home folder to delete

This will delete:
User: zoe
Folder: (none)

Type YES to confirm deletion:
```

---

## Deletion Process

1. Script shows user details
2. Displays what will be deleted:

   * User
   * Home folder (if safe)
3. You must type:

```
YES
```

Then:

```
DELETE
```

Only then will deletion proceed.

---

## Notes

* System accounts (e.g. `/usr/sbin/nologin`) usually have no usable home directory
* Script will skip folder deletion in those cases
* Designed for clarity, safety, and zero guesswork

---

## Disclaimer

This script performs **permanent deletion** of users and files.

Use carefully. You are responsible for any changes made to your system.

---

## Author

**J~Net 2026**
https://jnetai.com

