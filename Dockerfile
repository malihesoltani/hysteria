FRFROM golang:1.22 as builder

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN go build -o hysteria ./cmd/server

FROM debian:bookworm-slim

COPY --from=builder /app/hysteria /usr/local/bin/hysteria

ENTRYPOINT ["hysteria"]
