FROM golang:1.21-alpine AS builder
WORKDIR /build
COPY main.go .
RUN go build -o proxy main.go

FROM alpine:latest
WORKDIR /app
COPY --from=builder /build/proxy .
EXPOSE 8080
CMD ["./proxy"]
