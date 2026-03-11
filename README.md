# Leaky_bucket
### Purpose:
The point of this repo is to demonstrate key consepts of AWS security. 

### Prerequisites:
Python3.10+,
Docker,
LocalStack,
awscli,
vscode

## Setup:
I like to work from venv as this helps me keep track of my python packages

### Step 0:
I setup a localstack container (and verify) in docker and install requirements.txt

```
docker run -d -p 4566:4566 localstack/localstack |
docker ps
```

### Step 1:
I create the s3 bucket with awslocal (and verify)

```
awslocal s3 mb s3://leaky-bucket
awslocal s3 ls
```

### Step 2:
I create a policy for the bucket with the principle that give permission to anyone on the web (in my case my home network) to download files from the bucket
```
awslocal s3api put-bucket-policy --bucket leaky-bucket --policy file://policies/policy.json
```
### Step 3:
We can now add a secret to the bucket and test if anyone can access the bucket

```
echo "Secret" > secret.txt
awslocal s3 cp secret.txt s3://leaky-bucket/
```
We can verify this by deleting the local "secret.txt" and then copyting it from the leaky-bucket


```
rm secret.txt
awslocal s3 cp s3://leaky-bucket/secret.txt .
```


## Testing and remidiation:

As this is a locally hosted s3 bucket, tools like prowlser, scoutSuite or Trivy will not work as intended. 

```
python3 test.py
```
