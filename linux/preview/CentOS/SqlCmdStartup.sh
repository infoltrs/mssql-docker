#!/bin/bash
set -e

wait_time=90s
password=RedHat!23

# wait for SQL Server to come up
echo importing data will start in $wait_time...
sleep $wait_time

echo running CreateLogins...
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $password -d master -i setup.sql


exec "$@"