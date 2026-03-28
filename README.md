# AWS Infrastructure with Terraform

A Terraform project to provision AWS infrastructure including EC2 instances and S3 buckets.

## 📋 Prerequisites

Before you begin, ensure you have:
- **Terraform** (v1.14.8 or later) - [Install](https://www.terraform.io/downloads.html)
- **AWS CLI** - [Install](https://aws.amazon.com/cli/)
- **AWS Account** with credentials configured
- **Git** for version control

## 🚀 Quick Start

### 1. Clone the Repository
```bash
git clone https://github.com/sankalp-st/sankalp-aws-infrastructure.git
cd sankalp-aws-infrastructure
```

### 2. Initialize Terraform
```bash
terraform init
```

### 3. Plan the Infrastructure
```bash
terraform plan
```

### 4. Apply the Configuration
```bash
terraform apply
```

### 5. View Outputs
```bash
terraform output
```

### 6. Destroy Resources (when done)
```bash
terraform destroy
```

## 📦 What Gets Created

- **EC2 Instance** - t3.micro instance in ap-south-1
- **S3 Bucket** - For data storage

## 📝 Configuration

### Variables

All configurable values are in `variables.tf`:

| Variable | Description | Default |
|----------|-------------|---------|
| `region` | AWS region | `ap-south-1` |
| `instance_type` | EC2 instance type | `t3.micro` |
| `ami` | AMI ID for EC2 | `ami-0f5ee92e2d63afc18` |
| `bucket_name` | S3 bucket name | `sankalp-terraform-demo-12345` |

### Override Variables

```bash
terraform apply \
  -var="instance_type=t3.small" \
  -var="bucket_name=my-custom-bucket"
```

Or create a `terraform.tfvars` file:
```hcl
region           = "us-east-1"
instance_type    = "t3.small"
bucket_name      = "my-bucket-name"
```

## 📤 Outputs

After `terraform apply`, outputs include:
- **public_ip** - Public IP address of the EC2 instance

View outputs:
```bash
terraform output public_ip
```

## 🔧 Project Structure

```
.
├── main.tf           # EC2 and S3 resource definitions
├── provider.tf       # AWS provider configuration
├── variables.tf      # Variable definitions
├── output.tf         # Output definitions
├── .gitignore        # Git ignore rules
└── README.md         # This file
```

## 🔐 Security Best Practices

⚠️ **Never commit:**
- `.terraform/` directory
- `terraform.tfstate` files
- AWS credentials

These are already in `.gitignore`

## 📚 Common Commands

```bash
# Format code
terraform fmt

# Validate syntax
terraform validate

# Destroy all resources
terraform destroy

# Show current state
terraform show

# List resources in state
terraform state list

# View specific resource
terraform state show aws_instance.web
```

## 🐛 Troubleshooting

### Error: "Duplicate provider configuration"
- Ensure provider block is only in `provider.tf`

### Error: "resource not found in AWS"
- Verify AWS credentials are configured correctly
- Check you're viewing the correct AWS region (ap-south-1)

### Authentication issues
```bash
aws sts get-caller-identity
```

## 📖 Additional Resources

- [Terraform AWS Provider Docs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [Terraform Best Practices](https://www.terraform.io/docs/cloud/guides/recommended-practices.html)
- [AWS EC2 Documentation](https://docs.aws.amazon.com/ec2/)

## 👤 Author

Sankalp

## 📝 License

This project is open source and available under the MIT License.