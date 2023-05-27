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

Run the following commands (`./bin/setup.sh`):

```
docker pull mysql/mysql-server:latest
docker run -p3306:3306 --name=mysql1 -d mysql/mysql-server:5.7
docker exec -it mysql1 mysql -uroot -p
docker run
docker run -it -e NGROK_AUTHTOKEN=$NGROK_AUTHTOKEN ngrok/ngrok:latest http host.docker.internal:8080
```  

### TODO

- ~~Postman tests for local REST API endpoints~~
- Unit tests for local REST API endpoints
- ~~Add ngrok to expose REST API endpoints for ESP32 connection~~
- Test ESP32 connection
- Write deployment script to AWS EC2 Instance and test scripts to prevent faulty deployment (convert setup from docker to docker-compose)
- Write report (MVC, Design Pattern, TDD, CI/CD, Architecture, DB Schema)
- Create new folder for React application
- Implement UI and write unit tests
- Connect React frontend to NodeJS backend via REST API endpoints
- Add Auth through firebase/cognito
- Integration tests 
- Deployment to S3, deployment tests 
- Assist with other areas of project

## Tests

- Build Tests (`build_test.yaml` - checks if NodeJS server can build correctly).
- Unit Tests (TBA)
- Integration Tests (TBA)
- User Tests (TBA)