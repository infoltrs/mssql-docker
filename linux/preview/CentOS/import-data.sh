#!/bin/bash

echo hello-world > /usr/sql/bin/hello.txt

#wait for the SQL Server to come up
#sleep 60s

#run the setup script to create the DB and the schema in the DB
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P 'RedHat!23' -d master -i /usr/sql/bin/setup.sql

#import the data from the csv file
/opt/mssql-tools/bin/bcp DemoData.dbo.Products in "/usr/sql/bin/Products.csv" -c -t',' -S localhost -U sa -P 'RedHat!23'

exit 0
