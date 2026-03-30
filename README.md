# AWS Infrastructure with Terraform

Terraform project to provision an EC2 instance with a Node.js application on AWS using Infrastructure as Code.

## Prerequisites

- Terraform v1.0 or later
- AWS CLI
- AWS Account with appropriate credentials
- Git
- A GitHub repository URL for your Node.js application

## AWS Configuration

Setup AWS credentials:
```bash
aws configure
```

Enter your AWS Access Key ID and Secret Access Key.

## Terraform Workflow

```bash
terraform init        # Initialize Terraform (downloads AWS provider)
terraform plan        # Preview changes before applying
terraform apply       # Apply configuration and create resources
terraform destroy     # Remove all resources
```

## Configuration Variables

Edit `variables.tf` to customize:
- **`instance_type`** - EC2 instance type (default: t3.micro)
- **`ami`** - Ubuntu AMI ID (default: ami-0f5ee92e2d63afc18)
- **`repo_url`** - GitHub repository URL for your Node.js app (required)

Update `provider.tf` to change the AWS region (default: ap-south-1).

## Resources Created

- **EC2 Instance** - t3.micro in ap-south-1 with automatic Node.js setup
- **Security Group** - Allows inbound traffic on port 3000
- **Default VPC** - Uses AWS default VPC

## Accessing Your Application

After applying, view your application URL:
```bash
terraform output app_url
```

Get the EC2 public IP:
```bash
terraform output public_ip
```

Your Node.js application will be accessible at `http://<public-ip>:3000`

## GitHub Actions - Automated Deployment

This project includes a GitHub Actions workflow (`.github/workflows/deploy.yml`) for automated deployment.

### Setup GitHub Actions

1. **Add AWS Secrets** to your GitHub repository:
   - Go to repository Settings → Secrets and variables → Actions
   - Click "New repository secret" and add:
     - `AWS_ACCESS_KEY_ID` - Your AWS access key
     - `AWS_SECRET_ACCESS_KEY` - Your AWS secret key

2. **Trigger Deployment**:
   - Go to the Actions tab in your GitHub repository
   - Select "Auto Deploy App" workflow
   - Click "Run workflow"
   - Enter your Node.js GitHub repository URL
   - Click "Run workflow"

### What the Workflow Does

1. Checks out your code
2. Sets up Terraform
3. Configures AWS credentials from GitHub Secrets
4. Runs `terraform init`
5. Runs `terraform plan` to preview changes
6. Runs `terraform apply` to deploy automatically

### Manual Deployment (Local)

```bash
terraform init
terraform plan -var="repo_url=https://github.com/your-username/your-repo.git"
terraform apply -var="repo_url=https://github.com/your-username/your-repo.git"
```

## Cleanup

Remove all AWS resources:
```bash
terraform destroy
```

Confirm with `yes`.