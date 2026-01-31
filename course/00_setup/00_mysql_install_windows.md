# MySQL install on Windows (Community)

## Goal
Install MySQL Community Server 8.0.x on Windows using MySQL Installer (Community).

## Download
- Use MySQL Installer (Community) from the official MySQL downloads page.
- Choose the latest 8.0.x installer.

## Installer choices (exact)
- Setup Type: **Developer Default**
- Products: MySQL Server 8.0.x and MySQL Workbench 8.0.x (included in Developer Default)

## Server configuration (required)
- Config type: Development Computer
- Connectivity:
  - TCP/IP enabled
  - Port: **3306**
- Windows service:
  - Configure as a Windows service (MySQL80)
  - Start the service at system startup
- Authentication:
  - Use strong passwords
  - Set a root password and store it safely

## Verify the service
- Open Windows Services and confirm the MySQL service is running (MySQL80).
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

## First run checklist
- [ ] MySQL Server 8.0.x installed using Developer Default
- [ ] MySQL80 service running on port 3306
- [ ] MySQL Workbench 8.0.x installed
- [ ] Ready to connect with root in Workbench
- [ ] Next: run course/shared/reset.sql then Week 3 scripts successfully
