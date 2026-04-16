# Variables

Terraform variables allow you to:

- Move secrets to another file
- Define values that change between environments
  - AMI, tags, keypair, etc

## Variable Files

### providers.tf

Defines the cloud provider configuration and uses variables from `vars.tf`.

```hcl
provider "aws" {
  region = var.region
}
```

### vars.tf

Declares variables and optional defaults.

```hcl
variable "region" {
  default = "us-east-1"
}
```

### terraform.tfvars

- Provides values for variables. This file is automatically loaded by Terraform.

```hcl
variable "region" {} # if defined in env vars: export TF_VAR_region=us-west-1

```

### Environment Vars

- Only for dynamic/secret values

- Terraform (via AWS provider) reads standard AWS env vars:

```hcl
export AWS_ACCESS_KEY="your-key-here"
export AWS_SECRET_KEY="your-secret-here"
```
