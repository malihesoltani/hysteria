FROM golang:1.21.6

WORKDIR /app

COPY . .

RUN go mod tidy && go build -o hysteria ./cmd/server

EXPOSE 443

CMD ["./hysteria", "-c", "config.yaml"]
