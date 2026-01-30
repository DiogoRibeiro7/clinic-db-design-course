# 00_mysql_install_windows

## Goal
Install MySQL Community Server 8.0.x on Windows using MySQL Installer (Community).

## Download
- Use MySQL Installer (Community) from the official MySQL downloads page.
- Choose the latest 8.0.x installer.

## Install steps
1) Run MySQL Installer (Community).
2) Select a setup type that includes MySQL Server and MySQL Workbench.
3) Accept the defaults until the server configuration step.

## Server configuration (required)
- Config type: Development Computer (default is fine).
- Connectivity:
  - TCP/IP enabled
  - Port: 3306
- Windows service:
  - Configure as a Windows service
  - Start the service at system startup
- Authentication:
  - Use strong passwords
  - Set a root password and store it safely

## Verify the service
- Open Windows Services and confirm the MySQL service is running (usually named MySQL80).
- If it is stopped, start it manually.

## Troubleshooting
- Service not running:
  - Open Services and start MySQL80.
  - If it fails to start, review the MySQL error log in the data directory.
- Port conflicts:
  - If port 3306 is in use, either stop the conflicting service or reconfigure MySQL to a free port and note the new port.
- Connection errors:
  - Confirm the service is running.
  - Confirm you are using the correct host (127.0.0.1) and port (3306).
  - Reset the password in MySQL Installer if needed.
