#!/usr/bin/env bash
set -euo pipefail

host="${MYSQL_HOST:-127.0.0.1}"
port="${MYSQL_PORT:-3306}"
user="${MYSQL_USER:-root}"
pass="${MYSQL_PASSWORD:-root}"

db="clinic_db"
file="${1:-}"

if [[ -z "$file" ]]; then
  echo "Usage: check_integrity.sh <sql_file>" >&2
  exit 2
fi

if [[ ! -f "$file" ]]; then
  echo "File not found: $file" >&2
  exit 2
fi

output=$(mysql -h "$host" -P "$port" -u "$user" -p"$pass" \
  --database "$db" \
  --batch --raw --silent --skip-column-names \
  < "$file" || true)

if [[ -n "$output" ]]; then
  echo "Integrity checks returned rows (failing):" >&2
  echo "$output" >&2
  exit 1
fi

echo "Integrity checks returned 0 rows."
