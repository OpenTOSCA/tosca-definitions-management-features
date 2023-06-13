#! /bin/bash

command -v curl >/dev/null 2>&1 || {
  sudo apt-get install curl -y > /dev/null 2>&1
}

url=${Protocol:-http}://${IP:-localhost}:${Port:-80}/${context_root}

echo "Calling: $url" > availabilityTestUrl.log

if [[ $(curl -s -o availabilityTest.log -w "%{http_code}" $url) == 200 ]]; then
  echo "Result=success"
  sleep 5
  exit 0
else
  echo "Result=failure"
  sleep 5
  exit 1
fi
