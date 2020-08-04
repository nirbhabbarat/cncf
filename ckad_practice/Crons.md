# What are Jobs and CronJobs
Kubernetes provides the ability to easily run container workloads in a distributed cluster, but not all workloads need to run constantly. With jobs, we can run container workloads until they complete, then shut down the container. CronJobs allow us to do the same, but re-run the workload regularly according to a schedule.

### Relevant Documentation
- https://kubernetes.io/docs/concepts/workloads/controllers/jobs-run-to-completion/
- https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/
- https://kubernetes.io/docs/tasks/job/automated-tasks-with-cron-jobs/

