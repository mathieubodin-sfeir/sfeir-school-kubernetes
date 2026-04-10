<!-- .slide: class="two-column" -->
## Controllers > **reconciliation loops**

What is a reconciliation loop?
* The kube-controller-manager loops observe the current state
* Compare it to the desired state
* Act to reconcile the two.
This logic is called a reconciliation loop.
<br><br>

 3 Pods required, but one crashes — the controller automatically recreates the missing pod.
<!-- .element: class="admonition custom" data-admonition-icon="🖥️ Example" style="--admonition-bg-color:#0bb57f;" -->

##--##

<br><br><br><br>

![center h-550](./assets/images/control-loop.png)

##==##

## Controllers > **reconciliation loops**

In controllers, loops are triggered in different ways: 
* **Periodicity:** Controllers execute at regular intervals (configurable)
* **Events:** Triggered on specific events (watch API Server)
* **Exponential backoff:** In case of repeated errors, the interval between attempts increases  

There are controllers / operators designed to extend the Kubernetes API, each embedding reconciliation loops  

nginx-ingress-controller<br>
grafana-operator
<!-- .element: class="admonition custom" data-admonition-icon="🖥️ Example" style="--admonition-bg-color:#0bb57f;" -->
