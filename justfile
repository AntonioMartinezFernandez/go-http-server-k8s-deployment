run:
  @go run cmd/main.go

build:
  go build -o app cmd/main.go

dockerbuild:
  docker build . --tag go-http-server --file build/package/Dockerfile