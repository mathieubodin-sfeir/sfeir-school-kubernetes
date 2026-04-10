<!-- .slide: class="transition"-->

# Resources
## Services

##==##

<!-- .slide:-->

# Resources > **Services**

![center h-900](./assets/images/services.png)

##==##

<!-- .slide:-->

# Resources > Services > **definition**
**Definition:** A resource that allows access to a set of pods via a "label selector", and provides a DNS name and an IP to that set.
* Allows a resource to be accessible from outside.
* Links to services using label selectors.
* Acts as a reverse proxy (entry port to container port).
* Can be of several types:
  * ClusterIP
  * NodePort
  * LoadBalancer

##==##

<!-- .slide: class="two-column with-code-bg-dark" -->

# Resources > Services > **ClusterIP**

<br><br>  

![center](./assets/images/service-clusterip.png)

##--##

Exposes an application only inside the cluster.
* Accessible via the DNS **\<service-name\>.\<namespace\>.svc.cluster.local**.
* Can be coupled with an ingress to be accessible via an FQDN.

```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-service
spec:
  type: ClusterIP  # Can be omitted as it is the default type
  ports:
    - port: 80
      targetPort: 8080
  selector:
    app: my-app
```
##==##

<!-- .slide: class="two-column with-code-bg-dark" -->

# Resources > Services > **NodePort**

![center h-800](./assets/images/NodePort.png)

##--##

Exposes an application externally by opening a specific port on **all** cluster nodes
* Ports are in the range 30000-32767.
* Traffic arriving on this port is automatically routed to this service.
* The application is accessible via: **<Node_IP:port>**.
* ![sfeir-icons](alert-triangle)<!-- .element: style="--icon-size:48px; --icon-color:red;" --> There can only be one service per port!

```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-service
spec:
  type: NodePort
  ports:
    - port: 80
      targetPort: 8080
      nodePort: 30007
  selector:
    app: my-app
```

##==##

<!-- .slide: class="two-column with-code-bg-dark" -->

# Resources > Services > **LoadBalancer**

Exposes an application by assigning an external IP address through a LoadBalancer.
* A dedicated IP address per application.
* Incurs costs on cloud providers.

```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-service
spec:
  type: LoadBalancer
  ports:
    - port: 80
      targetPort: 8080
  selector:
    app: my-app
```

##--##

<br><br>

![center h-800](./assets/images/service-loadbalancer.png)

##==##

<!-- .slide: class="exercice" -->
## Quiz

Which service type is most appropriate for an internal database that should not be accessible from outside the cluster?
* LoadBalancer
* ClusterIP
* ExternalService
* NodePort

##==##

<!-- .slide: class="exercice" -->
## Quiz

Which service type is most appropriate for an internal database that should not be accessible from outside the cluster?
* LoadBalancer
* **ClusterIP**
* ExternalService
* NodePort

##==##

<!-- .slide: class="exercice" -->
## Quiz

True or False: A LoadBalancer service automatically creates an entry in external DNS.
* True
* False

##==##

<!-- .slide: class="exercice" -->
## Quiz

True or False: A LoadBalancer service automatically creates an entry in external DNS.
* True
* **False**

##==##

<!-- .slide: class="exercice" -->
## Quiz

What is the default port range for NodePort services?
* 1-65535
* 1024-29999
* 30000-32767

##==##

<!-- .slide: class="exercice" -->
## Quiz

What is the default port range for NodePort services?
* 1-65535
* 1024-29999
* **30000-32767**

##==##

<!-- .slide: class="transition-bg-sfeir-2" -->

# Lab: Service

##==##

<!-- .slide: class="exercice"-->
## LAB
# Lab: Create a service

https://killercoda.com/sfeir-killercoda/scenario/5-services
