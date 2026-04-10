<!-- .slide: class="two-column" -->

## Le cluster Kubernetes > **Vue d'ensemble**

![w-800](./assets/images/archi-kube.png)

##--##

<br><br><br>

Un cluster Kubernetes est composé à minima d'un control plane, et d'un worker node. Afin de conserver de la haute disponibilité, les workers nodes sont souvent au nombre de trois.
* **Control plane** : Il a pour rôle de maintenir l'état souhaité du cluster, en redémarrant des pods, ou en augmentant le nombre de réplica.
* **Worker node** : Ils ont pour rôle d'héberger les applications et d'être joignables de l'exterieur.

Notes:
##==##

<!-- .slide: class="two-column" -->

## Le cluster Kubernetes > **Le control plane**

![w-700](./assets/images/kube-control-plane.png)

##--##

<br>

Le control plane a pour but de maintenir l'état désiré du cluster, en étant responsable de l'orchestration. Il posséde les composants suivants :
* **kube-apiserver:**  Valide et traite les requêtes, gere l'authentification et permet aux nodes de connaitre l'état du cluster.
* **etcd:** Base de données de type clef / valeur, stockant l'état du cluster. C'est la source de vérité.
* **kube-scheduler:** Quand un pod n'est pas encore lancé, il regarde les ressources des nodes et selectionne la meilleure.
* **kube-controller-manager:** Gère tous les controllers du cluster.

Notes:
##==##

<!-- .slide: class="two-column" -->

## Le cluster Kubernetes > **Le worker node**

![w-700](./assets/images/kube-worker-node.png)

##--##

<br>

Le worker node a pour but de permettre aux pods applicatifs d'être démarrés grâce à une communication avec le control plane. Il posséde les composants suivants :
* **kubelet:** Agent qui execute les pods en suivant les specs des ressources demandées par l'api server.
* **kube-proxy:** Agent de gestion du réseau pour les pods au travers des services. C'est un proxy UDP/TCP.
* **container-runtime:** Agent responsable du pull des images, de lancer les conteneurs et leur allouer des ressources.

Notes:
##==##

<!-- .slide:-->

<!-- .slide: class="two-column" -->

## Le cluster Kubernetes > **Les pods**

![w-800](./assets/images/kube-pods.png)

##--##

<br><br><br>

C'est la plus petite ressource déployable sur Kubernetes, contenant un ou plusieurs conteneurs partageant le réseau et le stockage.
* **Réseau:** L'ensemble des conteneurs dans un pod partagent la même adresse IP.
* **Cycle de vie:** Tous les conteneurs d'un pod sont créés et détruits ensemble.
* **Gestion:** Généralement, ils sont gérés par des controllers de plus haut niveau (déploiement, statefulset ou daemonset).

Notes:
##==##

<!-- .slide:-->

## Le cluster Kubernetes > **Les composants additionnels: DNS**

![center h-600](./assets/images/kube-dns.png)

* Le dns interne est `core dns` remplacant de `kube-dns` depuis la version 1.11 en juillet 2018.
  * les requetes dns utilisent core dns pour connaitre les noms des services internes, et le `resolv.conf` de la machine hôte pour les noms externes.

##==##

<!-- .slide:-->

## Le cluster Kubernetes > **Les composants additionnels: CNI (Container Network Interface)**

![center h-700](./assets/images/kube-cni.png)

##==##

<!-- .slide:-->

## Le cluster Kubernetes > **Les composants additionnels: CSI (Container Storage Interface)**

![center h-500](./assets/images/kube-csi.png)


Pas de CSI installé sur le cluster à l'initialisation celui-ci étant dépendant du storage provider.  
<!-- .element: class="admonition warning" -->


##==##

<!-- .slide: class="exercice" -->
## Quiz

Quel composant du Control Plane est responsable de la prise de décisions concernant le placement des pods sur les nœuds ?
* kube-apiserver
* etcd
* kube-scheduler
* kubelet

##==##

<!-- .slide: class="exercice" -->
## Quiz

Quel composant du Control Plane est responsable de la prise de décisions concernant le placement des pods sur les nœuds ?
* kube-apiserver
* etcd
* **kube-scheduler**
* kubelet

##==##

<!-- .slide: class="exercice" -->
## Quiz

Quel composant stocke l'état et la configuration de l'ensemble du cluster Kubernetes ?
* kube-controller-manager
* etcd
* kube-proxy
* coredns

##==##

<!-- .slide: class="exercice" -->
## Quiz

Quel composant stocke l'état et la configuration de l'ensemble du cluster Kubernetes ?
* kube-controller-manager
* **etcd**
* kube-proxy
* coredns

##==##

<!-- .slide: class="exercice" -->
## Quiz

Quel agent s'exécute sur chaque nœud et est responsable de la communication avec le Control Plane pour s'assurer que les conteneurs fonctionnent dans un pod ?
* kube-proxy
* container runtime
* kubelet
* kube-scheduler

##==##

<!-- .slide: class="exercice" -->
## Quiz

Quel agent s'exécute sur chaque nœud et est responsable de la communication avec le Control Plane pour s'assurer que les conteneurs fonctionnent dans un pod ?
* kube-proxy
* container runtime
* **kubelet**
* kube-scheduler

##==##

<!-- .slide: class="exercice" -->
## Quiz

Quel composant est responsable de la gestion des règles réseau et de l'équilibrage de charge pour les services Kubernetes ?
* kubelet
* kube-proxy
* coredns
* kube-controller-manager

##==##

<!-- .slide: class="exercice" -->
## Quiz

Quel composant est responsable de la gestion des règles réseau et de l'équilibrage de charge pour les services Kubernetes ?
* kubelet
* **kube-proxy**
* coredns
* kube-controller-manager
