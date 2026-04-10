<!-- .slide: class="two-column" -->

# Pods > **What is a pod?**

It is the smallest resource in a Kubernetes cluster. 
* It contains one or more containers sharing the same lifecycle.
* Containers share the same IP and port space.
* They can communicate via the localhost network interface.
* They can share volumes.

##--##
<br>

![full-center](./assets/images/pods.png)

##==##

<!-- .slide: class="with-code-bg-dark two-column" -->

# Pods > **YAML**
Here is how to write a pod with the minimum required values.
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  containers:
  - name: nginx
    image: nginx:1.14.2
    ports:
    - containerPort: 80
```
##--##
A more complete example would be
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx
  labels: 
    app: nginx
    env: prod
spec:
  securityContext:
    runAsUser: 1000
    runAsGroup: 3000
    fsGroup: 2000
  serviceAccountName: my-serviceaccount
  automountServiceAccountToken: false
  containers:
  - name: nginx
    image: nginx:1.14.2
    ports:
    - containerPort: 80
    volumeMounts:
    - mountPath: /cache
      name: cache-volume
  volumes:
  - name: cache-volume
    emptyDir: {}
```
##==##

<!-- .slide: class="with-code-bg-dark two-column" -->

# Pods > YAML > **Environment variables**

```yaml
spec:
  containers:
  - name: school
    image: school:v1.0
    envFrom:
    - configMapRef:
        name: school-cm
    env:
    - name: DATABASE_USERNAME
      value: admin
    - name: DATABASE_URL
      valueFrom:
        configMapKeyRef:
          name: school-cm
          key: DB_URL
    - name: DATABASE_PASSWORD
      valueFrom:
        secretKeyRef:
          name: school-secrets
          key: DB_PASSWORD
```

##--##

<br><br>

Environment variables allow you to configure applications in a key/value format
* By providing the value directly.
* From a secret.
* From a configMap.
* In case of multiple declarations, values given in the pod take precedence over secret / configMap.

##==##

<!-- .slide: class="transition-bg-sfeir-2"-->

# Lab: Pods

##==##

<!-- .slide: class="exercice"-->
## LAB
# Lab: Pods

https://killercoda.com/sfeir-killercoda/scenario/2-pod
