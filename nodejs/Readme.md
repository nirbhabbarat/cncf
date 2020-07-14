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
## Create a folder for mounting
```
sudo mkdir -p /mongodata
sudo chmod +w /mongodata
```

## run docker image of mongodb
```
docker run -it -v /data/db:/mongodata \
  --network docker_network \
  --name mongodb -d mongo
```

## SSH to mongodb server for testing
```
docker exec -it mongodb /bin/bash
```