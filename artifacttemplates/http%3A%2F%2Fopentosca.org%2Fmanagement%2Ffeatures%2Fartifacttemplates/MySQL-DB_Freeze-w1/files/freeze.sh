#!/bin/bash

echo "Creating dump file..."
mysqldump -u"$DBUser" -p"$DBPassword" "$DBName" >./dump.state
echo "Successfully created dump!"

echo "Uploading file to $StoreStateServiceEndpoint"
curl -F "file=@dump.state" $StoreStateServiceEndpoint
echo "Successfully uploaded file!"

echo "Done."
