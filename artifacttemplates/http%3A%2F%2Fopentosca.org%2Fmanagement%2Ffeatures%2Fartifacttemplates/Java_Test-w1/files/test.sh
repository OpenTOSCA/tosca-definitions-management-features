#! /bin/bash

if java --version > javaTest.log 2>&1 ; then
  echo "Result=success"
  sleep 5
  exit 0
else
  echo "Result=failure"
  sleep 5
  exit 1
fi
