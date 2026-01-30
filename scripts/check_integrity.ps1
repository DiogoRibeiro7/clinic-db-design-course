param(
  [Parameter(Mandatory = $true)]
  [string]$SqlFile,
  [string]$User = "root",
  [string]$Database = "clinic_db",
  [string]$Host = "127.0.0.1",
  [int]$Port = 3306,
  [string]$Password = ""
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path $SqlFile)) {
  throw "SQL file not found: $SqlFile"
}

$mysqlArgs = @(
  "-h", $Host,
  "-P", $Port,
  "-u", $User,
  "--database", $Database,
  "--batch",
  "--raw",
  "--silent",
  "--skip-column-names"
)

if ($Password -ne "") {
  $env:MYSQL_PWD = $Password
}

$output = & mysql @mysqlArgs < $SqlFile
$exitCode = $LASTEXITCODE

if ($Password -ne "") {
  Remove-Item Env:MYSQL_PWD -ErrorAction SilentlyContinue
}

if ($exitCode -ne 0) {
  Write-Error "Integrity run failed (mysql exit code $exitCode)."
  exit $exitCode
}

if ($output -and $output.Trim().Length -gt 0) {
  Write-Error "Integrity checks returned rows (failing)."
  Write-Host $output
  exit 1
}

Write-Host "Integrity checks returned 0 rows."
exit 0
