# BalanceBug (PROD)

## Folder Structure

```
├── .github/workflows // contains CI/CD scripts
├── docker-compose.yaml // docker-compose script
├── frontend // react code
└── website // contains code for nodejs server
```

## DevOps Workflow

- [Overall Architecture](https://ibb.co/rfYRsJq)
- The code contained within this branch is code that will be deployed onto our EC2 instance via a simple CI/CD script that does two things: (1) it tests our code to see if it builds and (2) if so it deploys to the EC2 instance via `ssh` using our AWS private key, EC2 hostname and user_name. Then it pulls the latest changes into the code on the EC2 instance and runs `docker-compose up` to start the server.  
- NGiNX, our reverse proxy, redirects requests to the EC2 public IP address to the react server OR to the Node backend for our APIs. This ensures security for our MySQL Database, preventing it from facing the public internet. Our EC2 Security Group is configured to only allow ingress via Port 22 (SSH) and Port 80 (HTTP). As all Port 80 traffic will enter via our NGiNX reverse proxy, the database does not face the public internet.  
- Changes made to the security group configuration and infrastructure will be made to the `ops` branch, which contains Terraform code that describes all configuration matters pertaining to our infrastructure.  

## Sysadmin Reference

DB Access:

```
docker-compose up -d
docker-compose exec mysql bash
mysql -uroot -p
```