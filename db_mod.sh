#!/bin/sh
# db_create_date finds last table creation date
# db_mod_date finds last table modification date
# db_mod_date_secs converts the db_mod_date to seconds
# date_diff is the difference between today (now) and db_mod_date to find days between today and database last modification date

# Creating Directory to Dump Databases
mkdir -p -- /root/dbbackup

# Dumping, Finding Creation Time, Last Modification Time and Cleaning Up Unwanted Databases
for DB in $(echo "show databases" | mysql | grep -Ev "^(Database|mysql|performance_schema|information_schema)$");
do
	mysqldump $DB > /root/dbbackup/"$DB-$(date +%Y%m%d).sql";
	db_create_date=$(mysql -e "use $DB;select max(create_time) from information_schema.tables where table_schema = database();" | grep -v "\----" | grep -v "max(create_time)" | awk "{print $1}")
	db_mod_date=$(mysql -e "use $DB; select max(update_time) from information_schema.tables where table_schema = database();" | grep -v "\----" | grep -v "max(update_time)"| awk "{print $1}")
	if [ $db_mod_date == NULL ]
	then
		echo "Database $DB's last table was created on $db_create_date and was not modified after creation."
		echo ""
	else
		db_mod_date_secs=$(date -j -f "%Y-%m-%d %H:%M:%S" "${db_mod_date}" "+%s")
		today=$(date +%s)
		date_diff=$((($today -$db_mod_date_secs)/86400))
		echo "Database $DB was last modified $date_diff days ago."
		echo ""
	fi
done
