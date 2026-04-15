# Terraform

This repository contains tutorials and examples for learning and using Terraform.

## Installation

[Official HashiCorp Terraform installation guide for Windows, macOS, and Linux](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli#install-terraform)

## Terraform Commands

### Initialize working directory

Downloads required providers and sets up backend configuration.

```sh
terraform init
```

### Reformat configuration files

Automatically rewrites files to follow standard Terraform style.

```sh
terraform fmt
```

### Validate configuration

Checks syntax and internal consistency without calling cloud providers.

```sh
terraform validate 
```

### Plan

Shows the changes Terraform will make by comparing the current state with the desired configuration.

```sh
terraform plan
```

### Apply Changes

- Executes the changes that were already calculated (from a plan or inline refresh)
- Creates, updates, or deletes infrastructure resources to match the desired configuration
- Updates the Terraform state after successful execution

```sh
terraform apply
```

### Destroy previously-created infrastructure

Removes all resources managed by the current configuration.

```sh
terraform destroy
```
