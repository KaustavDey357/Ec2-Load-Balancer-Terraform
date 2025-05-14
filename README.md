## **Terraform AWS EC2 + Load Balancer Deployment**

This project uses **Terraform** to provision an **Amazon EC2 instance** behind an **Application Load Balancer (ALB)**, with proper **VPC networking** and **Security Groups** configured.

---

### **Architecture**

```
User
  │
  ▼
[ Load Balancer (ALB) ]
        │
        ▼
  [ Security Group ]
        │
        ▼
     [ EC2 Instance ]
```

---

### **What It Does**

* Creates a custom VPC and public subnet
* Launches an EC2 instance (Amazon Linux 2)
* Deploys an Application Load Balancer
* Configures Security Groups for HTTP traffic
* Sets up SSH key access to EC2
* Outputs useful information (ALB URL, public IP)

---

### **Getting Started**

#### **Prerequisites**

* Terraform installed (`>= 1.0.0`)
* AWS CLI installed & configured (`aws configure`)
* An AWS account with appropriate IAM permissions

---

### **Steps to Deploy**

```bash
git clone https://github.com/yourusername/terraform-ec2-lb.git
cd terraform-ec2-lb

terraform init # Initialize the Terraform working directory
terraform plan # Preview the infrastructure
terraform apply # Deploy the infrastructure
```

---

### **Outputs**

* Public IP of EC2 instance
* Load Balancer DNS name

You’ll see something like:

```
alb_dns = http://ec2-alb-123456789.us-east-1.elb.amazonaws.com
ec2_public_ip = 18.219.45.23
```

---

### **SSH Into EC2**

```bash
ssh -i ec2-key.pem ec2-user@<ec2_public_ip>
```

---

### **Destroy the Setup**

```bash
terraform destroy
```

---

### **Project Structure**

```
.
├── main.tf           # Orchestrator: may call modules or glue everything together
├── variables.tf      # All variable declarations with types and descriptions
├── outputs.tf        # Output values (e.g., IPs, DNS names, ARNs)
├── vpc.tf            # VPC, subnets, internet gateway, etc.
├── ec2.tf            # EC2 instance(s), AMIs, key pairs, EBS volumes
├── alb.tf            # Application Load Balancer, listeners, target groups
├── security.tf       # Security groups, network ACLs, firewall rules
├── README.md         # Project documentation
├── .gitignore        # Files to exclude from Git (e.g., `.terraform`, `*.tfstate`)

```

---

### **Notes**

* This setup uses a public subnet and opens port **80** to the world.
* The EC2 instance runs a simple HTTP server (Apache or Nginx).
* You can replace user\_data with your own app deployment script.

---
