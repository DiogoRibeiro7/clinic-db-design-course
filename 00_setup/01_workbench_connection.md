# 01_workbench_connection

## Goal
Create a local MySQL Workbench connection and set up the course schema and user.

## Create a connection
1) Open MySQL Workbench 8.0.x.
2) Click the plus icon next to MySQL Connections.
3) Set:
   - Connection name: clinic_local
   - Hostname: 127.0.0.1
   - Port: 3306
   - Username: root
4) Click Test Connection and enter the root password.
5) Save the connection.

## Create schema and user
Open a SQL tab and run:

```sql
CREATE SCHEMA IF NOT EXISTS clinic_db;

CREATE USER IF NOT EXISTS 'clinic_admin'@'localhost'
  IDENTIFIED BY 'change_me_strong_password';

GRANT ALL PRIVILEGES ON clinic_db.*
  TO 'clinic_admin'@'localhost';

FLUSH PRIVILEGES;
```

Notes:
- Change the password before class starts.
- Use clinic_admin for all course work.

## Troubleshooting
- Connection errors:
  - Verify the MySQL service is running.
  - Double-check hostname 127.0.0.1 and port 3306.
  - If the root password is unknown, reset it using MySQL Installer.
