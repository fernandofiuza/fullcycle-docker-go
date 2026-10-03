# Full Cycle Rocks!! - Imagem Docker em Go

Aplicação em Go que imprime `Full Cycle Rocks!!` no terminal, empacotada em uma imagem Docker com menos de 2MB.

## Imagem no Docker Hub

https://hub.docker.com/r/fernandinhofiuza/fullcycle

## Como executar

```bash
docker run fernandinhofiuza/fullcycle
```

Saída esperada:

```
Full Cycle Rocks!!
```

## Como a imagem ficou tão pequena

- **Multi-stage build**: o código é compilado em uma imagem `golang:1.24-alpine`, e só o binário final é copiado para a imagem de produção.
- **Imagem base `scratch`**: uma imagem vazia, sem sistema operacional, contendo apenas o executável.
- **Binário estático** (`CGO_ENABLED=0`): não depende de bibliotecas do sistema.
- **`-ldflags="-s -w"`**: remove símbolos e informações de debug do binário.
- **Sem o pacote `fmt`**: a saída usa `os.Stdout.WriteString`, o que reduz o tamanho do binário.

## Estrutura do projeto

```
├── Dockerfile
├── main.go
├── go.mod
└── README.md
```