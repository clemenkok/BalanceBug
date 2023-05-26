# BalanceBug

## Team Members

Hubert Choo, Lee Jian Rong, Yomna Mohamed, Shermaine Ang, Samsam Lee, Clemen Kok

## Folder Structure

```
├── .github/workflows // contains CI/CD scripts
├── chassis // physical design files
├── control // contains all code related to microcontroller, arduino and esp32
├── report // contains report data (drafts, assets etc)
├── vision // contains code for vision subsystem
└── website // contains code for react app, nodejs server
```

## Software Setup

### To run the NodeJS Backend Server on your machine

Run the following commands (to condense into a shell script later):

`docker run`
`docker pull mysql/mysql-server:latest`  
`docker run -p3306:3306 --name=mysql1 -d mysql/mysql-server:5.7`
`docker exec -it mysql1 mysql -uroot -p` (contact me for the password)  
`node server.js`  

### Deployment to AWS EC2 and S3

TBA  

## Tests

- Build Tests (`build_test.yaml` - checks if NodeJS server can build correctly).
- Unit Tests (TBA)
- Integration Tests (TBA)
- User Tests (TBA)