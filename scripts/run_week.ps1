param(
  [Parameter(Mandatory = $true)]
  [string]$WeekPath,
  [string]$User = "root",
  [string]$Database = "clinic_db",
  [string]$Host = "127.0.0.1",
  [int]$Port = 3306
)

$ErrorActionPreference = "Stop"

function Resolve-WeekFile {
  param(
    [string]$BasePath,
    [string[]]$Candidates
  )

  foreach ($name in $Candidates) {
    $path = Join-Path $BasePath $name
    if (Test-Path $path) {
      return $path
    }
  }

  return $null
}

$repoRoot = Split-Path -Parent $PSScriptRoot
$weekFullPath = Join-Path $repoRoot $WeekPath

if (-not (Test-Path $weekFullPath)) {
  throw "WeekPath not found: $WeekPath"
}

$resetFile = Join-Path $repoRoot "shared\reset.sql"
$schemaFile = Resolve-WeekFile $weekFullPath @("schema.sql", "schema_v1.sql", "schema_v2.sql")
$seedFile = Resolve-WeekFile $weekFullPath @("seed.sql", "seed_v1.sql", "seed_v2.sql", "seed_billing.sql")
$integrityFile = Resolve-WeekFile $weekFullPath @("integrity.sql", "integrity_v1.sql", "integrity_v2.sql")

if (-not (Test-Path $resetFile)) { throw "Missing shared/reset.sql" }
if (-not $schemaFile) { throw "No schema file found in $WeekPath" }
if (-not $seedFile) { throw "No seed file found in $WeekPath" }
if (-not $integrityFile) { throw "No integrity file found in $WeekPath" }

$mysqlArgs = @(
  "-h", $Host,
  "-P", $Port,
  "-u", $User
)

Write-Host "Running reset: $resetFile"
& mysql @mysqlArgs < $resetFile
if ($LASTEXITCODE -ne 0) { throw "Reset failed" }

Write-Host "Running schema: $schemaFile"
& mysql @mysqlArgs $Database < $schemaFile
if ($LASTEXITCODE -ne 0) { throw "Schema failed" }

Write-Host "Running seed: $seedFile"
& mysql @mysqlArgs $Database < $seedFile
if ($LASTEXITCODE -ne 0) { throw "Seed failed" }

Write-Host "Running integrity: $integrityFile"
& mysql @mysqlArgs $Database < $integrityFile
if ($LASTEXITCODE -ne 0) { throw "Integrity failed" }

Write-Host "Done."
