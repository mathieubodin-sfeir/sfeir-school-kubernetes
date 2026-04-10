<!-- .slide: class="transition"-->

# Namespaces

##==##

<!-- .slide: -->

# Namespaces > **overview**

They allow you to share a single cluster between multiple users, teams or applications, while maintaining logical separation.
* Resources are isolated from other namespaces.
* Resource names must be unique within a namespace, but not necessarily between namespaces.
* They allow applications or environments to be separated.
* Rights management can be done within namespaces through RBAC.
<br><br><br>

Deleting a namespace deletes all the resources it contains
<!-- .element: class="admonition danger" -->


##==##

<!-- .slide: class="with-code-bg-dark" -->

# Namespaces > **examples**
```bash
# List namespaces
$> kubectl get namespaces
NAME                       STATUS   AGE
default                    Active   350d
kube-system                Active   350d
school                     Active   350d

# Change namespace
$> kubectl config set-context --current --namespace=school
Context "kubernetes-admin@kubernetes" modified.

# Display all resources that are namespace-scoped
$> kubectl api-resources --namespaced=true
NAME                               SHORTNAMES                                      APIVERSION                               NAMESPACED   KIND
bindings                                                                           v1                                       true         Binding
configmaps                         cm                                              v1                                       true         ConfigMap
endpoints                          ep                                              v1                                       true         Endpoints
events                             ev                                              v1                                       true         Event
...
```
