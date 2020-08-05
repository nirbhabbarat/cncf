From a security perspective, it is often a good idea to place network-level restrictions on any communication between different parts of your infrastructure. NetworkPolicies allow you to restrict and control the network traffic going to and from your pods. We will apply NetworkPolicies and demonstrate how to create a simple policy to restrict access to a pod.

### Must Read
- https://kubernetes.io/docs/concepts/services-networking/network-policies/

```
 kubectl apply -f yaml_examples/network-policy.yml 
```


Use this command to get the cluster IP address of the Nginx pod:
```
kubectl get pod network-policy-secure-pod -o wide
```
Use the secure pod's IP address to test network access from the client pod to the secure Nginx pod:
```
kubectl exec network-policy-client-pod -- curl <secure pod cluster ip address>
```

```
kubectl get networkpolicies
kubectl describe networkpolicy my-network-policy
```