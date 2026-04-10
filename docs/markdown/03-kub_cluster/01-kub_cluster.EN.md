<!-- .slide: class="two-column" -->

## The Kubernetes cluster > **Overview**

![w-800](./assets/images/archi-kube.png)

##--##

<br><br><br>

A Kubernetes cluster consists of at least one control plane and one worker node. To maintain high availability, worker nodes typically number three.
* **Control plane**: Its role is to maintain the desired state of the cluster, by restarting pods or increasing the number of replicas.
* **Worker node**: Their role is to host applications and be reachable from the outside.

Notes:
##==##

<!-- .slide: class="two-column" -->

## The Kubernetes cluster > **The control plane**

![w-700](./assets/images/kube-control-plane.png)

##--##

<br>

The control plane maintains the desired state of the cluster, being responsible for orchestration. It has the following components:
* **kube-apiserver:** Validates and processes requests, manages authentication and allows nodes to know the cluster state.
* **etcd:** Key/value database storing the cluster state. It is the source of truth.
* **kube-scheduler:** When a pod is not yet scheduled, it looks at node resources and selects the best one.
* **kube-controller-manager:** Manages all controllers in the cluster.

Notes:
##==##

<!-- .slide: class="two-column" -->

## The Kubernetes cluster > **The worker node**

![w-700](./assets/images/kube-worker-node.png)

##--##

<br>

The worker node allows application pods to be started through communication with the control plane. It has the following components:
* **kubelet:** Agent that executes pods following the resource specs requested by the API server.
* **kube-proxy:** Network management agent for pods via services. It is a UDP/TCP proxy.
* **container-runtime:** Agent responsible for pulling images, starting containers and allocating resources to them.

Notes:
##==##

<!-- .slide:-->

<!-- .slide: class="two-column" -->

## The Kubernetes cluster > **Pods**

![w-800](./assets/images/kube-pods.png)

##--##

<br><br><br>

It is the smallest deployable resource in Kubernetes, containing one or more containers sharing the same network and storage.
* **Network:** All containers in a pod share the same IP address.
* **Lifecycle:** All containers in a pod are created and destroyed together.
* **Management:** They are generally managed by higher-level controllers (deployment, statefulset or daemonset).

Notes:
##==##

<!-- .slide:-->

## The Kubernetes cluster > **Additional components: DNS**

![center h-600](./assets/images/kube-dns.png)

* The internal DNS is `core dns`, which replaced `kube-dns` since version 1.11 in July 2018.
  * DNS requests use core dns to resolve internal service names, and the host machine's `resolv.conf` for external names.

##==##

<!-- .slide:-->

## The Kubernetes cluster > **Additional components: CNI (Container Network Interface)**

![center h-700](./assets/images/kube-cni.png)

##==##

<!-- .slide:-->

## The Kubernetes cluster > **Additional components: CSI (Container Storage Interface)**

![center h-500](./assets/images/kube-csi.png)


No CSI is installed on the cluster at initialization as it depends on the storage provider.  
<!-- .element: class="admonition warning" -->


##==##

<!-- .slide: class="exercice" -->
## Quiz

Which Control Plane component is responsible for making decisions about pod placement on nodes?
* kube-apiserver
* etcd
* kube-scheduler
* kubelet

##==##

<!-- .slide: class="exercice" -->
## Quiz

Which Control Plane component is responsible for making decisions about pod placement on nodes?
* kube-apiserver
* etcd
* **kube-scheduler**
* kubelet

##==##

<!-- .slide: class="exercice" -->
## Quiz

Which component stores the state and configuration of the entire Kubernetes cluster?
* kube-controller-manager
* etcd
* kube-proxy
* coredns

##==##

<!-- .slide: class="exercice" -->
## Quiz

Which component stores the state and configuration of the entire Kubernetes cluster?
* kube-controller-manager
* **etcd**
* kube-proxy
* coredns

##==##

<!-- .slide: class="exercice" -->
## Quiz

Which agent runs on each node and is responsible for communicating with the Control Plane to ensure containers are running in a pod?
* kube-proxy
* container runtime
* kubelet
* kube-scheduler

##==##

<!-- .slide: class="exercice" -->
## Quiz

Which agent runs on each node and is responsible for communicating with the Control Plane to ensure containers are running in a pod?
* kube-proxy
* container runtime
* **kubelet**
* kube-scheduler

##==##

<!-- .slide: class="exercice" -->
## Quiz

Which component is responsible for managing network rules and load balancing for Kubernetes services?
* kubelet
* kube-proxy
* coredns
* kube-controller-manager

##==##

<!-- .slide: class="exercice" -->
## Quiz

Which component is responsible for managing network rules and load balancing for Kubernetes services?
* kubelet
* **kube-proxy**
* coredns
* kube-controller-manager
