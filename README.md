# Shell Script for Dumping Databases, Checkinig Databases' Last Modification Time
This script takes backups of the databases, checks creation time, last modification time, find differences of days between present time and last modification time of any database.

## Clone the repository
Clone the repository, make required changes to the `ignore_dbs` file, grant required permission to the script and make it executable to run it 
```bash
cd ~/
git clone https://github.com/kinghub007/db_table_last_modified_time.git
cd db_table_last_modified_time
sudo chmod +x db_mod.sh
```

## CLI Usage:
```bash
cd ~/
cd db_table_last_modified_time
./db_mod.sh
```

# FYI
* Only privileged users are allowed to run the script.
