<!-- .slide: class="transition-bg-sfeir-3"-->

# **Readiness, Liveness and Startup Probes**

##==##

<!-- .slide: -->

# Orchestration > Readiness, Liveness and Startup Probes > **Readiness**

The readiness probe allows Kubernetes to determine whether a pod is ready to receive traffic through a service. It can be an HTTP, TCP or Linux command probe.

![center h-600](./assets/images/readiness.png)

##==##

<!-- .slide: class="with-code-bg-dark" -->

# Orchestration > Readiness, Liveness and Startup Probes > **Readiness**

Here is how to write an HTTP readiness probe with /health as the endpoint

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: pod-school
spec:
  containers:
  - name: pod-school
    image: school:v1.0
    readinessProbe:
      httpGet:
        path: /healthz
        port: 8080
      initialDelaySeconds: 10
      periodSeconds: 5
```

##==##

<!-- .slide: -->

# Orchestration > Readiness, Liveness and Startup Probes > **Liveness**

The liveness probe allows Kubernetes to determine whether a pod is functional and restarts it when necessary. It can be an HTTP, TCP or Linux command probe.

![center h-600](./assets/images/liveness.png)

##==##

<!-- .slide: class="with-code-bg-dark" -->

# Orchestration > Readiness, Liveness and Startup Probes > **Liveness**

Here is how to write a liveness probe executing a linux command

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: pod-school
spec:
  containers:
  - name: pod-school
    image: school:v1.0
    livenessProbe:
      exec:
        command:
          - cat
          - /tmp/healthy
      initialDelaySeconds: 15
      periodSeconds: 10
      failureThreshold: 3
```

##==##

<!-- .slide: class="with-code-bg-dark" -->

# Orchestration > Readiness, Liveness and Startup Probes > **Startup probe**

The startup probe allows Kubernetes to wait for an application to start before launching the readiness and liveness probes. This is useful for slow-starting applications. If it fails, the pod is restarted.

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: pod-school
spec:
  containers:
  - name: pod-school
    image: school:v1.0
    startupProbe:
      httpGet:
        path: /healthz
        port: 8080
      failureThreshold: 30
      periodSeconds: 10
```

##==##

<!-- .slide: class="transition-bg-sfeir-2"-->

# Lab: Readiness/Liveness

##==##

<!-- .slide: class="exercice"-->

## LAB
# Lab: Readiness/Liveness

https://killercoda.com/sfeir-killercoda/scenario/3-readiness

Notes:
Afternoon Break
