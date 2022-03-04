#!/bin/bash

printf "\r\n=====================================================================================\r\n"
printf "\r\nWP Plugin List\r\n"

wp plugin list | column -t

printf "\r\n=====================================================================================\r\n"
printf "\r\nWP Theme List\r\n"

wp theme list | column -t

printf "\r\n=====================================================================================\r\n"
printf "\r\nPreparing WP Healthcheck...\r\n"

# Preparing WP Healthcheck Deploy & Activate

wp plugin install wp-healthcheck --force --activate --quiet

# Remaining Script

printf "\r\n=====================================================================================\r\n"
printf "\r\nServer Info\r\n"

wp healthcheck server

printf "\r\nWP Filesystem Size Larger than 1MB\r\n"

printf "Size\tLast Modified\t\tFile/Folder\r\n" | column  && du --time -Scha -d 2 -t 1000000 | sort -rh | column  | ack --passthru "total"

printf "\r\n=====================================================================================\r\n"
printf "\r\nWP DB Breakdown\r\n"

printf "\r\nDatabases\r\n\r\n"

wp db query "SELECT table_schema AS 'Database', Engine, ROUND(SUM(data_length + index_length) / 1024 / 1024, 2) AS 'Size_MB' FROM information_schema.TABLES GROUP BY table_schema ORDER BY ROUND(SUM(data_length + index_length) / 1024 / 1024, 2) DESC;" | column -t

printf "\r\nTables\r\n\r\n"

wp db query "SELECT TABLE_SCHEMA AS 'Parent_Database', TABLE_NAME AS 'Table', TABLE_ROWS AS 'Row_Count', ROUND((DATA_LENGTH + INDEX_LENGTH) / 1024) AS 'Size_KB' FROM information_schema.TABLES WHERE TABLE_SCHEMA != 'information_schema' ORDER BY (DATA_LENGTH + INDEX_LENGTH) DESC;" | column -t

printf "\r\nAutoloaded Data\r\n\r\n"

wp healthcheck autoload | column -t

printf "\r\nTransient Data\r\n\r\n"

wp healthcheck transient | column -t

printf "\r\n=====================================================================================\r\n"
printf "\r\nCleanup...\r\n\r\n"

# Cleanup

wp plugin delete wp-healthcheck --quiet
