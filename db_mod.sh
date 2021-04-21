#!/bin/sh

# db_create_date finds last table creation date
# db_mod_date finds last table modification date
# db_mod_date_secs converts the db_mod_date to seconds
# date_diff is the difference between today (now) and db_mod_date to find days between today and database last modification date

# Creating Directory to Dump Databases
mkdir -p -- /root/dbbackup

# Dumping, Finding Creation Time, Last Modification Time and Cleaning Up Unwanted Databases
file=./ignore_dbs
while IFS= read -r line
do
	for DB in $(echo "show databases" | mysql | grep -Ev "^($line)$");
	do
		mysqldump $DB > /root/dbbackup/"$DB-$(date +%Y%m%d).sql";
		db_create_date=$(mysql -e "use $DB;select max(create_time) from information_schema.tables where table_schema = database();" | grep -v "\----" | grep -v "max(create_time)")
		db_mod_date=$(mysql -e "use $DB;select max(update_time) from information_schema.tables where table_schema = database();" | grep -v "\----" | grep -v "max(update_time)"
		db_mod_table=$(mysql -e "use $DB;select table_name, max(update_time) from information_schema.tables where table_schema = database();" | grep -v "\----" | grep -v "max(update_time)" | grep -v "table_name")

		if [ "$db_create_date" == NULL ]
		then
			echo "Database '$DB' does not contain any table."
            		echo ""
        	elif [ "$db_mod_date" == NULL ]
        	then
            		echo "Database '$DB' last table was created on '$db_create_date' and was not modified after creation."
            		echo ""
		else
			db_mod_date_secs=$(date --date="${db_mod_date}" +%s)
			today=$(date +%s)
			date_diff=$((($today - $db_mod_date_secs)/86400))
			echo "From database '$DB', last modified table and modification time are '$db_mod_table'."
			echo "Modification was done $date_diff days ago."
			echo ""
		fi
	done
done < "$file"
