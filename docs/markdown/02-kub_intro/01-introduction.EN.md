<!-- .slide:-->

## Introduction > **Open-source project**
![float-left h-300](./assets/images/K8S-logo.png)
* <https://github.com/kubernetes/kubernetes>

  * **113k+** stars
  * **3.7k+** contributors
* First project integrated at the creation of the CNCF in July 2015

##==##
## Introduction > **Cloud Native Computing Foundation**
![](./assets/images/cncf-orchestrator.png)
<div style="text-align: center">
  <a href="https://landscape.cncf.io" target="_blank">landscape.cncf.io</a>
</div>  

* Founded in 2015, it is a non-profit organization whose mission is to foster the adoption of technologies around Cloud.
  * hosts many open source projects
  * organizes events (kubecon)
  * offers certifications

##==##
## Introduction > **Overview**
![center h-800](./assets/images/archi-kube.png)

<!-- .element: class="credits" -->

Notes:
Briefly mention pods to be able to answer the quiz question

Kubernetes rewritten in Go by Googlers

Donated to the Cloud Native Computing Foundation in 2015

Kubernetes is just one tool among all the tools that can help you build "Cloud-Native" architectures

The Linux Foundation is a non-profit consortium founded on January 21, 2007, whose mission is to protect and standardize Linux by providing centralized resources and services; the Linux Foundation has 70 members.

##==##
## Introduction > **Versions (semver)**
Kubernetes uses semantic versioning (x.y.z) for its releases
* *x* is the **major** version number
* *y* is the **minor** version increment
* *z* is the **patch** level

When upgrading, the Kubernetes API is enriched, and API endpoints are rarely removed. A version upgrade is therefore rarely risky.
* Version 1.32.1 is the latest (14.01.2025)
* A minor version is released every 4 months.
* If an API becomes deprecated, it is removed after one year (i.e. 4 versions later).

##==##


<!-- .slide: class="two-column" -->
## Introduction > **Kubernetes, what for?**

![w-600](./assets/images/kub-for-what.svg)

##--##

<br><br>

- **Automated orchestration**: Few manual actions.
- **High availability**: Load balancing and automatic restart.
- **Scalability**: Possibility of automatic scaling.
- **Portability**: Nearly identical deployment between on-premise and different clouds.
- **Declarative management**: Having all deployments as code.
- **Rich ecosystem**: Enormous number of tools/extensions and an active community.

Notes:
Container orchestration in a cluster of machines

"helmsman of a ship" in Greek

##==##

<!-- .slide: class="exercice" -->
## Quiz

<br>

_Question_: Which of these runtimes is NOT supported in Kubernetes?

<br>

1. Containerd
2. Cri-o
3. gvisor
4. java runtime

##==##

<!-- .slide: class="exercice" -->

## Quiz

<br>

_Question_: Which of these runtimes is NOT supported in Kubernetes?

<br>

1. Containerd
2. Cri-o
3. gvisor
4. **java runtime**

##==##
<!-- .slide: class="exercice" -->
## Quiz

<br>

_Question_: In which language is Kubernetes developed?

<br>

1. C++
2. Java
3. Golang
4. PHP

##==##

<!-- .slide: class="exercice" -->

## Quiz

<br>

_Question_: In which language is Kubernetes developed?

<br>

1. C++
2. Java
3. **Golang**
4. PHP

##==##
<!-- .slide: class="exercice" -->
## Quiz

<br>

_Question_: What is the main role of a "Pod" in Kubernetes?

<br>

1. Store persistent data
2. Run one or more containers
3. Manage cluster networking
4. Orchestrate deployments

##==##

<!-- .slide: class="exercice" -->

## Quiz

<br>

_Question_: What is the main role of a "Pod" in Kubernetes?

<br>

1. Store persistent data
2. **Run one or more containers**
3. Manage cluster networking
4. Orchestrate deployments

##==##
<!-- .slide: class="exercice" -->
## Quiz

<br>

_Question_: Which command should you use to get information about running pods?

<br>

1. kubectl get pods
2. kubernetes list pods
3. k8s show pods
4. kube-ctl pods info

##==##

<!-- .slide: class="exercice" -->

## Quiz

<br>

_Question_: Which command should you use to get information about running pods?

<br>

1. **kubectl get pods**
2. kubernetes list pods
3. k8s show pods
4. kube-ctl pods info
