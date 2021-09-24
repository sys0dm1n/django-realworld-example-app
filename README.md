# Prerequisite 

- [Kubernetes Cluster](https://kubernetes.io/)
- [Helm](https://helm.sh/)
- [Dockerhub](https://hub.docker.com/r/sys0dm1n/django-realworld-example-app)

# About

This Helm chart will deploy a highly available and scalable [Django app](https://github.com/gothinkster/django-realworld-example-app)

To handle the scalability, I am using the `HorizontalPodAutoscaler`.
To make it resilient, I am using the `livenessProbe` and `readinessProbe`.
To make sure the app has at least one running pod on every node of the K8s cluster, I am using the `deployment` with multiple replicas.
To expose the application I am using `NodePort` but we can also use `LoadBalancer` which will exposes the Service externally using a cloud provider's load balancer.

# How to install
## Build Docker container
```bash
docker build --tag django-app .
docker tag django-app:latest sys0dm1n/django-realworld-example-app:v1.0
docker login
docker push sys0dm1n/django-realworld-example-app:v1.0
```
Build automation can be acheived by having a [Pro Dockerhub account](https://www.docker.com/pricing)

To run and test locally the image:
```bash
docker run --name django-app -d -p 5000:5000 django-app:latest

```

```bash
helm upgrade djano-app . -f values.yaml --namespace django --install --wait

```

# References:

- [Docker Redis Cluster](https://hub.docker.com/r/bitnami/redis/)
- [Docker RabbitMQ Cluster](https://hub.docker.com/r/bitnami/rabbitmq/)
- [Docker MySQL Cluster](https://hub.docker.com/r/bitnami/mysql)
