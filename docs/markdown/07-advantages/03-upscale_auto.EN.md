<!-- .slide:-->

# Orchestration > **Automatic scaling**

Kubernetes provides several mechanisms to automatically adjust the size of your applications based on load or other metrics.
There are three main types of autoscaling in Kubernetes:
* Horizontal Pod Autoscaler
* Vertical Pod Autoscaler
* Cluster Autoscaler

##==##

<!-- .slide: class="with-code-bg-dark" -->

# Orchestration > Automatic scaling > **Horizontal Pod Autoscaler**

Native to Kubernetes, it enables the creation of a new pod when a **cpu, ram or custom** metric exceeds a certain threshold.
```yaml
apiVersion: autoscaling/v2beta1
kind: HorizontalPodAutoscaler
metadata:
  name: school-hpa
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: school
  minReplicas: 2
  maxReplicas: 10
  metrics:
  - type: Resource
    resource:
      name: cpu
      targetAverageUtilization: 50
```

##==##

<!-- .slide: class="with-code-bg-dark" -->

# Orchestration > Automatic scaling > **Vertical Pod Autoscaler**

The [vertical pod autoscaler](https://github.com/kubernetes/autoscaler/tree/master/vertical-pod-autoscaler) CRD is not installed natively, but allows automatically modifying cpu and ram limits of deployments.

```yaml
apiVersion: autoscaling.k8s.io/v1
kind: VerticalPodAutoscaler
metadata:
  name: school-vpa
spec:
  targetRef:
    apiVersion: apps/v1
    kind:       Deployment
    name:       school
  updatePolicy:
    updateMode: "Auto"
```

##==##

<!-- .slide: class="with-code-bg-dark" -->

# Orchestration > Automatic scaling > **Cluster Autoscaler**

The cluster autoscaler increases the number of nodes in a cluster when existing nodes are over-consumed in resources. Configuration depends on the infrastructure running Kubernetes.  
For more information:
* https://github.com/kubernetes/autoscaler/tree/master/cluster-autoscaler

##==##

<!-- .slide: class="transition-bg-sfeir-2"-->

# Lab: Autoscaling

##==##

<!-- .slide: class="exercice" -->

## LAB
# Lab: Autoscaling

https://killercoda.com/sfeir-killercoda/scenario/7-autoscaling
