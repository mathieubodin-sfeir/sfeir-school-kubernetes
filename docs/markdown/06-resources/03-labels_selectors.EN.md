<!-- .slide: class="transition"-->

# Resources
## Labels

##==##

<!-- .slide: class="two-column" -->

# Resources > **Labels**

Labels, in the form of key-value pairs, are attached to Kubernetes resources. This allows: 
* Categorizing resources.
* Filtering for sets of resources.
* Associating resources (pod with deployment, service with deployment).

##--##

<br><br><br>
![](./assets/images/labels.png)

##==##

<!-- .slide: -->

# Resources > Labels > **Best practices**

The best practice for creating a label is to use: **\<prefix\>/\<name\>**. Take the example of an application broken down into microservices with a frontend, backend and database. A good use of labels would be:
* A label for the app, tier and role.
* A prefix for the company.

![center h-500](./assets/images/labels-effectivly.png)

##==##


<!-- .slide: -->

# Resources > Labels > **Display**

With kubectl, it is possible to display labels
* kubectl get pods --show-labels
* Result filtering is possible with the in, notin and exists operators

![center h-600](./assets/images/labels-filter.png)

Notes:
