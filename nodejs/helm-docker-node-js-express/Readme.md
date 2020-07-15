# DevOps Guide   
### Image not found error
When you build local docker images, they are not available in minikube. Cause after helm installation kubernetes will look into public repo like docker hub.
When it checks local repo, it won't find anything cause its build in your laptop not inside minikube
#### Solution
```
eval $(minikube docker-env)
```
And ImagePullPolicy is set to Never
After execution of above command all your docker commands will start running for docker service running inside your minikube.
This will only be in effect till you don't exist terminal session.

### create docker image for nodejs application
```
docker build -t docker_node_js_express:v1 .
```

### Helm install
```
helm install docker-node-js-express ./helm-docker-node-js-express
```