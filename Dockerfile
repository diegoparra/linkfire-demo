FROM golang:alpine AS builder

WORKDIR /src

COPY main.go go.* /src/

RUN CGO_ENABLED=0 go build -o /bin/simple-app
#RUN GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o ./simple-app

FROM scratch

COPY --from=builder /bin/simple-app /bin/simple-app

ENTRYPOINT ["/bin/simple-app"]
