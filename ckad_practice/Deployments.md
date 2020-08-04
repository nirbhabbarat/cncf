# What are Deployments
Deployments provide a variety of features to help you automatically manage groups of replica pods.

# Deploy nginx with 2 replica sets

```
kubectl apply -f yaml_examples/deploy-example1.yml
kubectl get deployments
```

# Deploy nginx and we will test rolling updates and rollbacks
One powerful feature of Kubernetes deployments is the ability to perform rolling updates and rollbacks.

### Change image and record it
```
kubectl set image deployments/example-deployment02 nginx=nginx:1.7.10
```
### see all recorded deployments
```
kubectl rollout history deployments/example-deployment02
```

### see specific revision in deployments
```
kubectl rollout history deployments/example-deployment02 --revision=2
```
linuxacademycontent/candy-service:3
### undo last deployments
```
kubectl rollout undo deployments/example-deployment02
```

### undo to specific revision deployments
```
kubectl rollout undo deployments/example-deployment02 --to-revision=1
```