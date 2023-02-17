FROM golang:1.20.1-alpine3.17 AS builder
WORKDIR /work
COPY . /work
RUN go build

# Path: Dockerfile
FROM alpine:3.14
COPY --from=builder /work/sample /work/sample
ENTRYPOINT ["/work/sample"]
