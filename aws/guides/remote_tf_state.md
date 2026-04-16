# Remote Terraform State File

## Setup

!!! tip
    Make sure you are on the right region before creating an S3 Bucket.

### Create S3 Bucket

1. Go to: `AWS Console` → `Amazon S3` → `General purpose buckets`
2. Select `General purpose`
3. Give a unique value for `Bucket name`
4. Click `Create bucket`

### Create terraform Folder

After the bucket is created, do the following:

1. Click on your newly created bucket name
2. Select `Create folder`
3. Enter `terraform` as the folder name
4. Click `Create folder`
