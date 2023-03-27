#!/bin/bash

echo "Creating dump file..."
# -y or long: --no-tablespaces is required for MySQL 8
mysqldump -u"$DBUser" -p"$DBPassword" "$DBName" -y >./dump.state
echo "Successfully created dump!"

command -v curl >/dev/null 2>&1 || {
  sudo apt-get install curl -y > /dev/null 2>&1
}

echo "Uploading file to $StoreStateServiceEndpoint"
curl -F "file=@dump.state" $StoreStateServiceEndpoint
echo "Successfully uploaded file!"

echo "Done."
