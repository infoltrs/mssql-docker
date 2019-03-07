#!/bin/bash

#start SQL Server, start the script to create the DB and import the data, start the app
#/opt/mssql/bin/sqlservr & /usr/sql/bin/import-data.sh & npm start
./SqlCmdStartup.sh & /opt/mssql/bin/sqlservr