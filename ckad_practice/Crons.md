# What are Jobs and CronJobs
Kubernetes provides the ability to easily run container workloads in a distributed cluster, but not all workloads need to run constantly. With jobs, we can run container workloads until they complete, then shut down the container. CronJobs allow us to do the same, but re-run the workload regularly according to a schedule.

### Relevant Documentation
- https://kubernetes.io/docs/concepts/workloads/controllers/jobs-run-to-completion/
- https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/
- https://kubernetes.io/docs/tasks/job/automated-tasks-with-cron-jobs/

## Example - run a simple job and print hello
```
kubectl apply -f yaml_examples/job-example1.yml
kubectl get jobs
kubectl get pods | grep example-job | awk '{print $1}'| xargs kubectl logs
```

## Example - run a simple cron job and print hello every minute
```
kubectl apply -f yaml_examples/job-example2.yml
kubectl get pods -w
```