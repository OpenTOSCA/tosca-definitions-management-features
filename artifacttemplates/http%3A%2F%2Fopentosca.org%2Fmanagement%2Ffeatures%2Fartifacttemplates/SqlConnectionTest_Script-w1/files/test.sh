#! /bin/bash
command -v mysql >/dev/null 2>&1 || {
  echo "Result=failure"
  sleep 5
  return 1
}
if mysql -u"${DBUser}" -p"${DBPassword}" -h"localhost" -P"${DBMSPort}" -e "SELECT IFNULL(table_schema,'total') 'Database', TableCount FROM (SELECT COUNT(1) TableCount, table_schema FROM information_schema.tables WHERE table_schema NOT IN ('information_schema','mysql') GROUP BY table_schema WITH ROLLUP) A;" "${DBName}" >/dev/null 2>&1 ; then
  echo "Result=success"
  sleep 5
  exit 0
else
  echo "Result=failure"
  sleep 5
  exit 1
fi
