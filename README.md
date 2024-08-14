# go-http-server-k8s-deployment

Just an example of deploying a simple golang http server on a Kubernetes cluster

## Requirements

1. [Golang](https://go.dev/dl/)
2. [Just](https://github.com/casey/just)
3. [Docker Desktop](https://www.docker.com/products/docker-desktop/)
4. [Kubectl](https://kubernetes.io/docs/tasks/tools/#kubectl)

## Available commands

**Run application as standalone**

```bash
just run
```

Check running with

```bash
curl localhost:8080
curl localhost:8080/headers
```

**Build application binary**

```bash
just build
```

**Build docker image**

```bash
just dockerbuild
```

**Deploy to local kubernetes cluster -e.g. Docker Desktop- using the local built image**

```bash
just deploy
```

Check deployment with

```bash
kubectl get services -n go-http-server
curl localhost:8000
```

**Deploy to local kubernetes cluster -e.g. Docker Desktop- using the image from remote registry -Dockerhub-**

```bash
just deployfromremote
```

Check deployment with

```bash
kubectl get services -n go-http-server
curl localhost:8000
```

**Show logs from all deployment pods**

```bash
just showlogs
```

**Teardown the local kubernetes deployment -e.g. Docker Desktop-**

```bash
just teardown
```

## Extra

### How to push docker image to dockerhub

1. Access to `https://hub.docker.com/` and Sign In
2. Create a new repository with your docker hub account (Button `Create repository`)
3. Open a terminal and execute:

```bash
sudo docker login # Enter username and password
sudo docker build . --tag <username>/<repository-name>:<tag> --file <dockerfile-location>
# Example: sudo docker build . --tag antoniomarfer/go-http-server:latest --file build/package/Dockerfile
sudo docker push <username>/<repository-name>:<tag>
# Example: sudo docker push antoniomarfer/go-http-server:latest
```
