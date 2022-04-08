# Basars gRPC Docker

Docker build image for Basars gRPC servers


### Building from Dockerfile
```bash
git clone https://github.com/Basars/basars-grpc-docker.git
cd basars-grpc-docker
docker build -t basars-grpc-server:1.0 .
```

### Running built Docker image
```bash
docker run -d -p 9000:9000 --restart always --name basars-grpc basars-grpc-server:1.0
```
It will take several seconds until preparing gRPC server.<br>
Go out and grab some coffee for a while. :)