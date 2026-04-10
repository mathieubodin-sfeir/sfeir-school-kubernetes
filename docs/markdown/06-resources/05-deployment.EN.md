<!-- .slide: class="transition"-->

# Resources
## Deployments

##==##

<!-- .slide: class="two-column with-code-bg-dark" -->

# Resources > **Deployments**

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx-container
        image: nginx:latest
        ports:
        - containerPort: 80
```
##--##

<br><br>

Deployments are Kubernetes resources that manage the lifecycle of pods through ReplicaSets.
* Contains a desired application state that the controller ensures to maintain.
* Allows scaling the application via the number of replicas.
* Progressive updates (rolling update) and rollback possible.
* Failed pods in a deployment are automatically restarted.

##==##

<!-- .slide: class="with-code-bg-dark"-->

# Resources > Deployments > **spec**

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
```

The first part of a deployment contains the desired state of pod templates (second part)
* **replica**: Number of pods created to be served by the service.
* **selector**: Used to identify pods managed by the deployment via labels.
* **template**: Describes the desired pods of the deployment.

##==##

<!-- .slide: class="with-code-bg-dark"-->

# Resources > Deployments > **template**

The second part of a deployment contains the description of the pod managed by the deployment
* **metadata**: Contains labels, required for deployment / pod association.
* **containers**: Can contain one or more containers (initContainer, sidecar).
* **going further**: Can have volumes, health checks, affinity, limits, variables.

```yaml
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx-container
        image: nginx:latest
        ports:
        - containerPort: 80
```

##==##

<!-- .slide: class="transition-bg-sfeir-2" -->

# Lab: Deployments

##==##

<!-- .slide: class="exercice"-->

## LAB
# Lab: Deployments

https://killercoda.com/sfeir-killercoda/scenario/6-deployment
