# Estágio 1: compila o binário
FROM golang:1.24-alpine AS builder
WORKDIR /app
COPY go.mod main.go ./
RUN CGO_ENABLED=0 go build -ldflags="-s -w" -o /app/fullcycle main.go

# Estágio 2: imagem final, vazia
FROM scratch
COPY --from=builder /app/fullcycle /fullcycle
ENTRYPOINT ["/fullcycle"]docker run --rm