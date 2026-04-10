<!-- .slide:-->

# Orchestration > **Application updates**

There are several methods for updating applications in Kubernetes. The main idea is to make the update as smooth as possible.
* Rolling update
* Canary deployment
* Blue / Green deployment
* Recreate

##==##

<!-- .slide: class="with-code-bg-dark" -->

# Orchestration > Application updates > **Rolling update**

```yaml
spec:
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxUnavailable: 25%
      maxSurge: 25%
```

This is the default update strategy.
1. A pod with the new version is created.
2. Once the pod is **running**, a pod from the old version is deleted.
3. Steps 1 and 2 are repeated until every pod is running the new version.
<br><br>

Both versions coexist briefly.
<!-- .element: class="admonition important" -->

##==##

<!-- .slide: class="with-code-bg-dark" -->

# Orchestration > Application updates > **Recreate**

Strategy implemented in Kubernetes. Useful if versions cannot coexist. Downtime between deletion and creation.
1. Pods are destroyed.
2. Pods are recreated in the new version.

```yaml
spec:
  strategy:
    type: Recreate
```

##==##

<!-- .slide: class="two-column" -->

# Orchestration > Application updates > **Blue / Green deployment**

Non-native Kubernetes strategy. The principle is to deploy two versions of the application in parallel, but only one receives traffic. No downtime during the service switch.
1. A second version of the application is launched.
2. Traffic is switched to version 2.
3. Traffic is switched back to version 1 if necessary.

##--##

<br><br><br>

![center h-550](./assets/images/blue-green.png)

##==##

<!-- .slide: class="two-column" -->

# Orchestration > Application updates > **Canary deployment**

![center h-700](./assets/images/canary.png)

##--##

<br><br>

Non-native Kubernetes strategy. The principle is to deploy two versions of the application in parallel. Traffic is routed, for example, 10% to v2 while 90% is still sent to v1.
1. A second version of the application is launched.
2. A small portion of traffic is sent to v2.
3. In case of issues, all traffic is sent to v1; otherwise, traffic is progressively switched to v2.
