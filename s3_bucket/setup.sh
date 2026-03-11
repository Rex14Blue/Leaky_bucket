#!/bin/bash

echo "Creating vulnerable bucket..."

awslocal s3 mb s3://leaky-bucket

echo "Applying insecure policy..."

awslocal s3api put-bucket-policy \
--bucket leaky-bucket \
--policy file://policies/policy.json

echo "Uploading sensitive file..."

awslocal s3 cp secret.txt s3://leaky-bucket/

echo "Lab ready."
