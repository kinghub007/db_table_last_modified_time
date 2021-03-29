# Shell Script for Dumping Databases, Checkinig Databases' Last Modification Time & Cleaning Up Unwanted Databases
This script takes backups of the databases, checks creation time, last modification time, find differences of days between present time and last modification time of any database and performs cleanup accordingly.

## Clone the repository
Clone the repository and grant required permission and make it executable to run it.
```bash
cd ~/
git clone git@gitea.modirum.com:kingshuk.chowdhury/db_last_mod_date_n_cleanup.git
cd db_last_mod_date_n_cleanup
sudo chmod +x db_mod.sh
```

## CLI Usage:
```bash
cd ~/
cd db_last_mod_date_n_cleanup
./db_mod.sh
```

# FYI
* Only privileged users are allowed to run the script.
