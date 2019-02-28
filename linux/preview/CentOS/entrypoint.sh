#start SQL Server, start the script to create the DB and import the data, start the app
sqlservr & sleep 90s & /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P 'RedHat!23' -d master -i /usr/sql/bin/setup.sql && /opt/mssql-tools/bin/bcp DemoData.dbo.Products in "/usr/sql/bin/Products.csv" -c -t',' -S localhost -U sa -P 'RedHat!23'
