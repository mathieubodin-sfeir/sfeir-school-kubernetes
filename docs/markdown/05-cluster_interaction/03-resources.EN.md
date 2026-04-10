<!-- .slide: class="transition-bg-sfeir-3"-->

# Resources

Notes:

Configuration file: written in yaml or json, this file describes the desired state of a Kubernetes resource. In a file, one or more object descriptions can be included

##==##

<!-- .slide: class="with-code-bg-dark" -->

# Resources > **Imperative creation**
It is possible to create Kubernetes resources with kubectl.  
This method is useful in specific cases: 
* testing 
* troubleshooting
* demonstration, ...

```bash
# Generic syntax for creating a resource
$> kubectl create <type-of-object> [<subtype-of-object>] <name-of-object> <properties> 
# Create a namespace
$> kubectl create namespace <my-namespace>
# Create a pod
$> kubectl run <pod-name> --image=<image>
# Create file my-pod.yaml, containing a pod <pod-name> with image <image>
$> kubectl run <pod-name> --image=<image> --dry-run=client -o yaml > my-pod.yaml
```

##==##

<!-- .slide: class="with-code-bg-dark" -->

# Resources > Imperative creation > **pod example**
```bash
# Create a pod
kubectl run pod-school -n school --image busybox -- sleep 4800
pod/pod-school created

# Display our pod
❯ k get pod -n school
NAME                     READY   STATUS    RESTARTS   AGE
pod-school               1/1     Running   0          8s
```
Which gives us
![center h-450](./assets/images/ressources-pod.png)
##==##

<!-- .slide: -->

# Resources > **Declarative creation**
Resources are created from YAML files with the following advantages
* Resource management as code (via GitOps).
* Enables complex deployments.
* Simplifies deployment across different environments (dev, staging, prod).
* Simplifies rollbacks or upgrades.
* Can be integrated with continuous deployment (ArgoCD / FluxCD).

##==##

<!-- .slide: class="with-code-bg-dark" -->
# Resources > Declarative creation > **Manifests**
To deploy a pod with the declarative method, you need to write the pod in YAML format.
```YAML
apiVersion: v1
kind: Pod
metadata:
  labels:
    run: pod-school
  name: pod-school
  namespace: school
spec:
  containers:
    image: school:v1.0
    name: pod-school
```

##==##

<!-- .slide: class="with-code-bg-dark" -->
# Resources > Declarative creation > **With kubectl**
Once you have manifests, you can use kubectl to interact with your cluster.

```bash
# Create or modify a resource
$ kubectl apply -f my-pod.yaml
# Recreate the resource
$ kubectl replace -f my-pod.yaml
# Show differences between the existing resource on the cluster and the manifest
$ kubectl diff -f my-pod.yaml
# Delete the resource
$ kubectl delete -f my-pod.yaml 
```
