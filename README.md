# go-http-server-k8s-deployment

Just an example of deploying an http server application made with Golang in a Kubernetes cluster

## Recommended tools

1. [Golang](https://go.dev/dl/)
2. [Just](https://github.com/casey/just)
3. [Docker](https://www.docker.com/products/docker-desktop/)
4. [Kubectl](https://kubernetes.io/docs/tasks/tools/#kubectl)

## Run application as standalone

```bash
just run
```

From a different terminal...

```bash
curl localhost:8080
curl localhost:8080/headers
```

## Build application binary

```bash
just build
```

## Build docker image

```bash
just dockerbuild
```
