# Prerequisite 

- [Kubernetes Cluster](https://kubernetes.io/)
- [Helm](https://helm.sh/)
- [Docker](https://docs.docker.com/get-docker/)
- [Dockerhub](https://hub.docker.com/r/sys0dm1n/django-realworld-example-app)

# About

This Helm chart will deploy a highly available and scalable [Django app](https://github.com/gothinkster/django-realworld-example-app)

To handle the scalability, I am using the `HorizontalPodAutoscaler`.
To make it resilient, I am using the `livenessProbe` and `readinessProbe`.
To make sure the app has multiple replicas on the K8s cluster and preventing downtime if one node goes down, I am using the `deployment` with multiple replicas.
To expose the application I am using `LoadBalancer` which will exposes the Service externally using a cloud provider's load balancer.

# How to install
## Build Docker container
```bash
docker build --tag django-app .
docker tag django-app:latest sys0dm1n/django-realworld-example-app:latest
docker login
docker push sys0dm1n/django-realworld-example-app:latest
```
Build automation can be acheived by having a [Pro Dockerhub account](https://www.docker.com/pricing)

To run and test locally the image:
```bash
docker run --name django-app -d -p 5000:5000 django-app:latest

```
## Deploy the application to K8s

```bash
cd helm
helm upgrade --install -f values.yaml --namespace prod --create-namespace django-app . --wait

```

# References:

- [django-realworld-example-app](https://github.com/gothinkster/django-realworld-example-app)
