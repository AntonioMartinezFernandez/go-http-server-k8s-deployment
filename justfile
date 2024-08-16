test:
  go test -race ./...

cleancache:
  go clean -testcache

run:
  @go run cmd/main.go

build:
  go build -o app cmd/main.go

dockerbuild:
  docker build . --tag go-http-server --file build/package/Dockerfile

deploy:
  kubectl apply -f deployments/namespace.yaml
  kubectl apply -f deployments/deployment-from-local-registry.yaml
  kubectl apply -f deployments/service.yaml

deployfromremote:
  kubectl apply -f deployments/namespace.yaml
  kubectl apply -f deployments/deployment-from-remote-registry.yaml
  kubectl apply -f deployments/service.yaml

showlogs:
  kubectl logs -l app=go-http-server --all-containers=true -n go-http-server --since=1h

teardown:
  kubectl delete -f deployments/service.yaml
  kubectl delete -f deployments/deployment-from-local-registry.yaml
  kubectl delete -f deployments/namespace.yaml
