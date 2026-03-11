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
I create a policy for the bucket with the principle that
