# AWS Infrastructure with Terraform

Terraform project to provision EC2 instance and S3 bucket on AWS.

## Prerequisites

- Terraform v1.14.8
- AWS CLI
- AWS Account
- Git

## AWS Configure

Setup AWS credentials:
```bash
aws configure
```

Enter your AWS Access Key ID and Secret Access Key.

## Three Terraform Commands

```bash
terraform init        # Initialize Terraform
terraform plan        # Preview changes
terraform apply       # Apply configuration
```

## Variables File

Edit `variables.tf` to change:
- `region` - AWS region (default: ap-south-1)
- `instance_type` - EC2 type (default: t3.micro)
- `ami` - AMI ID (default: ami-0f5ee92e2d63afc18)
- `bucket_name` - S3 bucket name (default: sankalp-terraform-demo-12345)

## Resources Created

- **EC2 Instance** - t3.micro in ap-south-1
- **S3 Bucket** - For storage

## Check Output

View resources created:
```bash
terraform output
```

Get EC2 public IP:
```bash
terraform output public_ip
```

## Destroy Terraform

Remove all resources:
```bash
terraform destroy
```

Confirm with `yes`.