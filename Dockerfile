FROM golang:1.21-alpine

WORKDIR /app

COPY . .

RUN go build -o hysteria ./cmd/server

EXPOSE 443

CMD ["./hysteria", "-c", "config.yaml"]
