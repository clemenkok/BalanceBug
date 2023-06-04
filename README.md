# BalanceBug (PROD)

## Folder Structure

```
├── .github/workflows // contains CI/CD scripts
├── frontend // react code
└── website // contains code for nodejs server
```

## DevOps Workflow

- [Overall Architecture](https://ibb.co/rfYRsJq)
- The code contained within this branch is code that will be deployed onto our EC2 instance via a simple CI/CD script that does two things: (1) it tests our code to see if it builds and (2) if so it deploys to the EC2 instance via `ssh` using our AWS private key, EC2 hostname and user_name. Then it pulls the latest changes into the code on the EC2 instance and runs `docker-compose up` to start the server.  
- NGiNX, our reverse proxy, redirects requests to the EC2 public IP address to the react server OR to the nodejs backend for our APIs.  
- To relook into security matters (how do we secure our APIs - option A is API key with DB lookup, option B is NGiNX basic http auth - we will go with B for now). There are 2 ingress/egress points for our VPC - first is when the ESP32 needs to send/receive HTTP packets via RESTful API, and second is when we access our UI to start the loop.   

## Sysadmin Reference

DB Access:

```
docker-compose up -d
docker-compose exec mysql bash
mysql -uroot -p
```