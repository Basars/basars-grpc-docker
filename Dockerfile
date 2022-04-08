FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

ENV ROOT_DIR /basars_server
ENV BASARS_GRPC_HOST [::]
ENV BASARS_GRPC_PORT 9000
ENV BASARS_POOL_WORKERS 10

RUN apt update -y
RUN apt upgrade -y
RUN apt install -y python3.9 python3-pip git
RUN mkdir $ROOT_DIR
RUN git clone https://github.com/Basars/basars-grpc.git $ROOT_DIR

WORKDIR $ROOT_DIR

RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install -r requirements.txt
RUN python3 -m grpc_tools.protoc -I . --python_out=. --grpc_python_out=. basars_grpc_core/protos/basars.proto

EXPOSE $BASARS_GRPC_PORT
ENTRYPOINT [ "python3", "-m", "basars_grpc_server.server"]
