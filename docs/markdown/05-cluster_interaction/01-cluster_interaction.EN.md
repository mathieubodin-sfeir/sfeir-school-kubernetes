<!-- .slide: class="two-column" -->
# Interacting with a cluster > **kubectl**
![h-500](./assets/images/kubectl-config.png)

##--##
<br><br><br><br><br>
Kubernetes command-line client written in Go that interacts with the Kubernetes API.
* Uses the **~/.kube/config** file by default to connect to the cluster.
* A single file can contain multiple clusters, organized into contexts.
* A context is a combination of cluster + user.

Notes:
##==##

<!-- .slide: class="with-code-bg-dark" -->
# Interacting with a cluster > kubectl > **common commands**
```BASH
# list pods
$> kubectl get pods -n kube-system
NAME                                        READY   STATUS    RESTARTS        AGE
etcd-prod-k8s-cplane01                      1/1     Running   16 (10h ago)    335d
kube-apiserver-prod-k8s-cplane01            1/1     Running   16 (10h ago)    175d
...

# describe an object
$> kubectl describe pod etcd-prod-k8s-cplane01 -n kube-system
Name:                 etcd-prod-k8s-cplane01
Namespace:            kube-system
...

# create an object (imperative method)
$> kubectl create deployment sfeir-school --image busybox --replicas 1 -n school
deployment.apps/sfeir-school created

# exec into a pod
$> kubectl exec -n school -it school -- bash
/ $ whoami
school
```

##==##

<!-- .slide: class="with-code-bg-dark" -->
# Interacting with a cluster > kubectl > **advanced commands**
```BASH
# Patch a pod by changing its image
$> kubectl patch pod school -p '{"spec":{"containers":[{"name":"school-kubernetes","image":"school:v2.O"}]}}'

# List all images of all pods in the cluster
$> kubectl get pods -A -o=custom-columns='IMAGES:spec.containers[*].image'
registry.k8s.io/coredns/coredns:v1.10.1
registry.k8s.io/etcd:3.5.9-0
registry.k8s.io/kube-apiserver:v1.28.0
registry.k8s.io/kube-controller-manager:v1.28.0
registry.k8s.io/kube-proxy:v1.28.0
registry.k8s.io/kube-scheduler:v1.28.0
...

# Display all nodes that are not control planes
$> kubectl get node --selector='!node-role.kubernetes.io/control-plane'
NAME                STATUS   ROLES    AGE    VERSION
prod-k8s-worker01   Ready    <none>   430d   v1.28.0
prod-k8s-worker02   Ready    <none>   233d   v1.28.0
```

##==##

<!-- .slide: class="with-code-bg-dark" -->

# Interacting with a cluster > kubectl > **Cheat sheet**

Each kubectl command has a help accessible using -h. Here is an example when creating a secret
```bash
kubectl create secret generic -h
Create a secret based on a file, directory, or specified literal value...

Examples:
  # Create a new secret named my-secret with keys for each file in folder bar
  kubectl create secret generic my-secret --from-file=path/to/bar

  # Create a new secret named my-secret with key1=supersecret and key2=topsecret
  kubectl create secret generic my-secret --from-literal=key1=supersecret --from-literal=key2=topsecret

  # Create a new secret named my-secret from env files
  kubectl create secret generic my-secret --from-env-file=path/to/foo.env --from-env-file=path/to/bar.env
```
<br>

There is also a dedicated kubectl page on the official Kubernetes website
* https://kubernetes.io/fr/docs/reference/kubectl/cheatsheet/

##==##

<!-- .slide: class="two-column" -->

# Interacting with a cluster > kubectl > **k9s, the kubectl UI**

Terminal UI for managing Kubernetes clusters.
* Real-time visualization of cluster resources.
* Fast navigation between different resource types.
* Management of pods, deployments, services, etc…
* Log visualization and command execution in pods.

##--##
<br><br><br><br>
![center h-500](./assets/images/k9scli.png)
<div style="text-align: center">
  <a href="https://k9scli.io/" target="_blank">k9scli.io</a>
</div>

##==##

<!-- .slide: class="exercice" -->
## Quiz

Which kubectl command would you use to get a list of all pods in the current namespace?
* kubectl list pods
* kubectl get pods
* kubectl show pods
* kubectl describe pods

##==##

<!-- .slide: class="exercice" -->
## Quiz

Which kubectl command would you use to get a list of all pods in the current namespace?
* kubectl list pods
* **kubectl get pods**
* kubectl show pods
* kubectl describe pods

##==##

<!-- .slide: class="exercice" -->
## Quiz

How would you execute a shell command in a specific pod named "my-pod"?
* kubectl run my-pod
* kubectl shell my-pod
* kubectl exec -it my-pod -- /bin/bash
* kubectl enter my-pod

##==##

<!-- .slide: class="exercice" -->
## Quiz

How would you execute a shell command in a specific pod named "my-pod"?
* kubectl run my-pod
* kubectl shell my-pod
* **kubectl exec -it my-pod -- /bin/bash**
* kubectl enter my-pod

##==##

<!-- .slide: class="exercice" -->
## Quiz

Which kubectl option allows you to apply a YAML configuration file to your cluster?
* kubectl create -f config.yaml
* kubectl apply -f config.yaml
* kubectl update -f config.yaml
* kubectl configure -f config.yaml

##==##

<!-- .slide: class="exercice" -->
## Quiz

Which kubectl option allows you to apply a YAML configuration file to your cluster?
* kubectl create -f config.yaml
* **kubectl apply -f config.yaml**
* kubectl update -f config.yaml
* kubectl configure -f config.yaml

##==##

<!-- .slide: class="exercice" -->
## Quiz

How do you get detailed information about a service named "my-service"?
* kubectl info my-service
* kubectl get my-service
* kubectl describe service my-service
* kubectl details my-service

##==##

<!-- .slide: class="exercice" -->
## Quiz

How do you get detailed information about a service named "my-service"?
* kubectl info my-service
* kubectl get my-service
* **kubectl describe service my-service**
* kubectl details my-service

##==##

<!-- .slide: class="transition-bg-sfeir-2"-->

# Lab: Kubectl

##==##

<!-- .slide: class="exercice"-->
## LAB
# Lab: Kubectl

https://killercoda.com/sfeir-killercoda/scenario/1-kubectl


Notes:
