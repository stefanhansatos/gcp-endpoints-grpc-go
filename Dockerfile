FROM golang:alpine

RUN apk update \
  && apk add git

COPY . /go/src/app

#RUN find /go/src/app
#
#RUN pwd && ls -l
#
#ENV GO111MODULE=on
#
#RUN /usr/local/go/bin/go build -o /go/bin/server /go/src/app/server/main.go
##
#RUN cd /go/src/app/server && rm go.mod && go mod init && go mod vendor && go install
#
# Don't do this in production! Use vendoring instead.
RUN go get -v app/server

RUN go install app/server

ENTRYPOINT ["/go/bin/server"]






#RUN go mod init app/server

#RUN go mod vendor

#RUN go install /go/src/app/server


##RUN go env
#
#ENV GO111MODULE=on
#
##ENV GOPATH=/tmp
#
#RUN go env
#
#RUN go mod init app/server
#
##   RUN go mod vendor
#
#RUN go install app/server
#
#ENTRYPOINT ["/go/bin/server"]
#