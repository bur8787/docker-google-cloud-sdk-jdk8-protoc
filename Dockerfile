FROM google/cloud-sdk:alpine

RUN apk --update add openjdk8
RUN gcloud components install kubectl -q
ENV PROTOC_VERSION 3.3.0
ENV PROTOC_ZIP protoc-$PROTOC_VERSION-linux-x86_64.zip
RUN curl -OL https://github.com/google/protobuf/releases/download/v$PROTOC_VERSION/$PROTOC_ZIP
RUN apk add unzip
RUN unzip -o $PROTOC_ZIP -d /usr/local bin/protoc
RUN rm -f $PROTOC_ZIP
