<!-- .slide: class="transition"-->

# Resources
## ConfigMap & Secrets

<!-- .slide: class="two-column" -->

# Resources > **ConfigMap**

**Definition:** A ConfigMap is a Kubernetes resource used to store non-confidential data in key/value format. 
* They are used through environment variables or volumes. 
* Useful for separating environment-specific values.

##--##

<br>

![h-900](./assets/images/configmap.png)

##==##

<!-- .slide: class="with-code-bg-dark" -->

# Resources > ConfigMap > **Manifest**
```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: nginx-conf
data:
  nginx.conf: |
    user nginx;
    worker_processes  1;
    events {
      worker_connections  10240;
    }
    http {
      server {
          listen       80;
          server_name  localhost;
          location / {
            root   /usr/share/nginx/html; #Change this line
            index  index.html index.htm;
        }
      }
    }
```

##==##

<!-- .slide: class="with-code-bg-dark two-column" -->

# Resources > ConfigMap > **Volumes**

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
...
    spec:
      containers:
        - name: nginx
          image: nginx:latest
          volumeMounts:
            - name: nginx-config
              mountPath: /etc/nginx/conf.d/default.conf
              subPath: nginx.conf
      volumes:
        - name: nginx-config
          configMap:
            name: nginx-config
```
##--##

<br><br><br>

* The volume indicates which ConfigMap to mount as a file in the pod (it must be in the same namespace as the deployment).
* The volumeMount indicates that the ConfigMap should be injected into the file /etc/nginx/conf.d/nginx.conf.

##==##

<!-- .slide: -->

# Resources > **Secrets**

**Definition:** A Secret is a Kubernetes resource used to store confidential data in key/value format. 
* They are used through environment variables or volumes. 
* Stored in plain text in the etcd database by default
<br><br>


Secrets are base64 encoded, not encrypted
<!-- .element: class="admonition important" -->

##==##

<!-- .slide: class="with-code-bg-dark" -->

# Resources > Secrets > **Manifest**
A secret with base64-encoded content
```yaml
apiVersion: v1
kind: Secret
metadata:
  name: dotfile-secret
data:
  .secret-file: dmFsdWUtMg0KDQo=
```

A secret with plain text content
```yaml
apiVersion: v1
kind: Secret
metadata:
  name: secret-basic-auth
type: kubernetes.io/basic-auth
stringData:
  username: admin # required field for kubernetes.io/basic-auth
  password: t0p-Secret # required field for kubernetes.io/basic-auth
```

##==##

<!-- .slide: class="transition-bg-sfeir-2" -->

# Lab: Resources > **ConfigMap & Secrets**

##==##

<!-- .slide: class="exercice"-->
## LAB
# Lab: ConfigMap and Secrets



https://killercoda.com/sfeir-killercoda/scenario/4-configmap-secrets

Notes:
Lunch Break

##==##

<!-- .slide: class="bg-blur" -->

<br>

### It's time for the lunch break

<br>

![](pause-circle 'tc-icons feather')<!-- .element: style="--tc-icon-size:300px; --tc-icon-color:var(--light-grey);" -->

<br>

See you in an hour

<!-- .element: class="center" -->
