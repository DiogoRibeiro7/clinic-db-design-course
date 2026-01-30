#!/usr/bin/env bash
set -euo pipefail

week_path=""
user="root"
database="clinic_db"
host="127.0.0.1"
port="3306"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --week_path)
      week_path="$2"; shift 2;;
    --user)
      user="$2"; shift 2;;
    --database)
      database="$2"; shift 2;;
    --host)
      host="$2"; shift 2;;
    --port)
      port="$2"; shift 2;;
    *)
      echo "Unknown option: $1" >&2; exit 2;;
  esac
done

if [[ -z "$week_path" ]]; then
  echo "Usage: run_week.sh --week_path <folder> [--user u] [--database db] [--host h] [--port p]" >&2
  exit 2
fi

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
week_full_path="$repo_root/$week_path"

if [[ ! -d "$week_full_path" ]]; then
  echo "Week path not found: $week_path" >&2
  exit 2
fi

reset_file="$repo_root/shared/reset.sql"

pick_file() {
  local base="$1"
  shift
  for name in "$@"; do
    if [[ -f "$base/$name" ]]; then
      echo "$base/$name"
      return 0
    fi
  done
  return 1
}

schema_file=$(pick_file "$week_full_path" schema.sql schema_v1.sql schema_v2.sql)
seed_file=$(pick_file "$week_full_path" seed.sql seed_v1.sql seed_v2.sql seed_billing.sql)
integrity_file=$(pick_file "$week_full_path" integrity.sql integrity_v1.sql integrity_v2.sql)

if [[ ! -f "$reset_file" ]]; then
  echo "Missing shared/reset.sql" >&2
  exit 2
fi

if [[ -z "$schema_file" || -z "$seed_file" || -z "$integrity_file" ]]; then
  echo "Missing schema/seed/integrity files in $week_path" >&2
  exit 2
fi

echo "Running reset: $reset_file"
mysql -h "$host" -P "$port" -u "$user" < "$reset_file"

echo "Running schema: $schema_file"
mysql -h "$host" -P "$port" -u "$user" "$database" < "$schema_file"

echo "Running seed: $seed_file"
mysql -h "$host" -P "$port" -u "$user" "$database" < "$seed_file"

echo "Running integrity: $integrity_file"
mysql -h "$host" -P "$port" -u "$user" "$database" < "$integrity_file"

echo "Done."
