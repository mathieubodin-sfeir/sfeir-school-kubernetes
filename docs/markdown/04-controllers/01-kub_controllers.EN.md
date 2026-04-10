## Controllers > **kube-controller-manager**

Controllers are essential components that enforce the desired state in the cluster using a reconciliation loop.  
In a fresh cluster, the main controllers are grouped inside the **kube-controller-manager** pod, which includes the following controllers:
* **Deployment Controller:** Manages ReplicaSets and ensures proper Pod updates
* **StatefulSet Controller:** Manages stateful Pods (used for databases, etc.)
* **DaemonSet Controller:** Ensures a Pod runs on all nodes
* **Job Controller:** Launches Pods to execute one-off tasks
* **Node Controller:** Monitors Nodes, detects degraded health states
* **Namespace Controller:** Handles recursive deletion of objects in a namespace
* **...**
