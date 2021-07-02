# Shell Script for  Checkinig Databases' Table Creation & Last Modification Time
This script checks creation time, last modification time, find differences of days between present time and last modification time as well as  present time and creation time of any database and saves unmodified databases in the `unmodified_dbs` file.

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

## FYI
* Only privileged users are allowed to run the script.
