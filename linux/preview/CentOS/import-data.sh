#!/bin/bash

#wait for the SQL Server to come up
sleep 60s

#run the setup script to create the DB and the schema in the DB
echo "/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P 'RedHat!23' -d master -i /usr/sql/bin/setup.sql"
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P 'RedHat!23' -d master -i /usr/sql/bin/setup.sql -o /usr/sql/bin/setup.log

#import the data from the csv file
echo "/opt/mssql-tools/bin/bcp DemoData.dbo.Products in "/usr/sql/bin/Products.csv" -c -t',' -S localhost -U sa -P 'RedHat!23'"
/opt/mssql-tools/bin/bcp DemoData.dbo.Products in "/usr/sql/bin/Products.csv" -c -t',' -S localhost -U sa -P 'RedHat!23' -e /usr/sql/bin/bcp-error.log

exit 0
