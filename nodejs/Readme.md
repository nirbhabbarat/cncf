# User Guide


## Create docker bridge network
This will be used later in the document
```
docker network create -d bridge docker_network
```

## How to run the node js docker code?
```
docker build -t docker_node_js_express:v1 . # docker build
```

## check list of images
```
docker images|grep docker_node_js_express
```

#### expected output

```
docker_node_js_express        v1                   39fb8b7b2b17        40 seconds ago      96.5MB
```

## Run docker image
``` 
docker run -p 3000:3000 \
  --network docker_network \
  --name docker_node_js_express \
  docker_node_js_express:v1 
 ```

## Test running docker container
```
curl -v localhost:3000
```

# Create mongo db image

## Pull image
```
docker pull mongo
```

## run docker image of mongodb
```
docker run -it \
  -p 27017:27017 \
  --network docker_network \
  --name mongodb -d mongo
```


## SSH to mongodb server for testing
```
docker exec -it mongodb /bin/bash
docker exec -it docker_node_js_express  /bin/sh
```

## Docker networking
- You can connect one docker to another by using --network while running docker container.
- SSH to a container and then ping container_name
- Or try below command to test network between 2 containers.
```
docker exec -ti docker_node_js_express ping mongodb
```


## Cleanup
```
docker rm -f docker_node_js_express
docker rmi -f docker_node_js_express:v1
```



# Deploy docker images to Kubernetes (minikube and  skaffold)
- https://kubernetes.io/docs/concepts/services-networking/connect-applications-service

k8s.yml and skaffold.yml are present in this repo, it will deploy single pod and expose mongodb pod to nodejs pod
```
skaffold dev
```


#### Read More: 
- https://hub.docker.com/_/mongo
- https://mongoosejs.com/docs/index.html
- https://kubernetes.io/docs/tasks/debug-application-cluster/debug-application/
