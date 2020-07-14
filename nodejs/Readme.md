# User Guide

## How to run the node js docker code?
```docker build -t docker_node_js_express:v1 . # docker build```

## check list of images
```docker images|grep docker_node_js_express```

#### expected output

```docker_node_js_express        v1                   39fb8b7b2b17        40 seconds ago      96.5MB```


## Run docker image
``` docker run  -p 3000:3000 docker_node_js_express:v1```

## Test running docker container
```curl -v localhost:3000```