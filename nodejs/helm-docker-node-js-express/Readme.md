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

### Deploy Mongo POD and Service
```
kubectl apply -f mongo-k8s.yml
```

### Helm install
```
helm install docker-node-js-express ./helm-docker-node-js-express
```

### Enable the Ingress controller 
```
minikube addons enable ingress
```


### Configure credentials for AWS Elastic Container Registry
Read this first 
- https://minikube.sigs.k8s.io/docs/tutorials/configuring_creds_for_aws_ecr/
- https://hub.packtpub.com/how-to-push-docker-images-to-aws-elastic-container-registryecr-tutorial/
#### create ECR Repo

```
aws ecr create-repository --repository-name docker-node-js-express-demo
```
#### Auto delete images after 100 images
```
aws ecr put-lifecycle-policy --registry-id ACCOUNT_ID --repository-name docker-node-js-express-demo --lifecycle-policy-text '{"rules":[{"rulePriority":10,"description":"Expire old images","selection":{"tagStatus":"any","countType":"imageCountMoreThan","countNumber":100},"action":{"type":"expire"}}]}'
```

### Push Images
#### Authenticate
```
aws ecr get-login --registry-ids ACCOUNT_ID --no-include-email

$(aws ecr get-login --registry-ids ACCOUNT_ID --no-include-email)
```

####
`aws ecr describe-repositories|grep repositoryUri`

```
docker build -t docker_node_js_express .
```
##### Output
```
Successfully tagged docker_node_js_express:latest
```

#### Now tag recently create docker image:tag as ecr_repo:tag

```
docker tag docker_node_js_express:latest ACCOUNT_ID.dkr.ecr.REGION.amazonaws.com/docker-node-js-express-demo:latest

```

Syntax: `docker tag SOURCE_IMAGE[:TAG] TARGET_IMAGE[:TAG]`

```
docker push ACCOUNT_ID.dkr.ecr.REGION.amazonaws.com/docker-node-js-express-demo:latest 
```
Note: Common mistakes: https://docs.aws.amazon.com/AmazonECR/latest/userguide/common-errors-docker.html#error-403

#### Deploy yml in minikube

```
kubectl apply -f docker-node-js-express-demo-ecr.yml
```

```
kubectl get pods
```
```
kubectl describe pods NAME
```
#### output
Check Events Section in bottom, you will find something like
`Successfully pulled image "ACCOUNT_ID.dkr.ecr.REGION.amazonaws.com/docker-node-js-express-demo:latest"`

#### Read More
- https://kubernetes.io/docs/tasks/access-application-cluster/ingress-minikube/
