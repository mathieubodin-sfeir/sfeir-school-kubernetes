<!-- .slide:-->

# Volumes > **Definition**

Volumes allow pods to mount a directory containing data or not. 
* The lifetime of a volume is tied to the pod (not the container), allowing data to persist across restarts.
* Multiple volume types are supported:
  * configMap
  * emptyDir
  * hostPath
  * nfs
  * persistentVolumeClaim
  * secret
  * ...

##==##

<!-- .slide: class="two-column with-code-bg-dark" -->

# Volumes > **usage**

A volume is attached to a pod, but mounted in a container.
* **volumeMounts:** List of volumes and their mount points (in the container specs).
* **volumes:** List of volumes and their type (in the pod specs).

##--##

<br><br>

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: school
spec:
  containers:
  - name: school
    image: school:v1.0
    volumeMounts:
    - name: my-volume
      mountPath: /data
  volumes:
  - name: my-volume
    emptyDir: {}
```
##==##

<!-- .slide: class="with-code-bg-dark" -->

# Volumes > type > **emptyDir**

Empty volume created when a pod starts, deleted when the Pod is deleted.
* Allows data sharing between containers of the same pod.
* Can be used as a cache (tmp).
* Not cleared in case of container crash.

```yaml
volumes:
  - name: cache-volume
    emptyDir: {}
# In memory: 
volumes:
- name: cache-volume
  emptyDir:
    medium: Memory
```

##==##

<!-- .slide: class="with-code-bg-dark" -->

# Volumes > type > **hostPath**

```yaml
volumes:
- name: host-volume
  hostPath:
    path: /data
    type: Directory
```

Mounts or creates a file from the worker node's filesystem where the pod runs. Therefore has access to the node's resources.
* Data remains on the host even after pod deletion.
* Lack of security (no isolation).
* Not portable between nodes, except NFS use case.

##==##

<!-- .slide: class="with-code-bg-dark" -->

# Volumes > type > **PersistentVolumeClaim**

Requests a volume from a **persistentVolume** (linked to a storage infrastructure).
* PersistentVolumes are generally created automatically through **storageClass**.
* PVCs allow defining the desired access mode (RWO, RWX, ...).
* Defines the desired storage amount.

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: my-pvc
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
  storageClassName: standard
```

##==##

<!-- .slide: class="exercice" -->
## Quiz

Which Kubernetes volume type is recommended for persistent storage in a production environment?
* emptyDir 
* hostPath 
* PersistentVolume (PV) 
* configMap

##==##

<!-- .slide: class="exercice" -->
## Quiz

Which Kubernetes volume type is recommended for persistent storage in a production environment?
* emptyDir 
* hostPath 
* **PersistentVolume (PV)**
* configMap

##==##

<!-- .slide: class="exercice" -->
## Quiz

Which Kubernetes resource is used to request a persistent volume?
* VolumeRequest
* PersistentVolumeClaim (PVC)
* StorageClass
* VolumeBinding

##==##

<!-- .slide: class="exercice" -->
## Quiz

Which Kubernetes resource is used to request a persistent volume?
* VolumeRequest
* **PersistentVolumeClaim (PVC)**
* StorageClass
* VolumeBinding

##==##

<!-- .slide: class="exercice" -->
## Quiz

Which volume type is ephemeral and deleted when the pod is terminated?
* NFS
* emptyDir
* PersistentVolume
* awsElasticBlockStore



##==##

<!-- .slide: class="exercice" -->
## Quiz

Which volume type is ephemeral and deleted when the pod is terminated?
* NFS
* **emptyDir**
* PersistentVolume
* awsElasticBlockStore

##==##

<!-- .slide: class="transition-bg-sfeir-2"-->

# Lab: Volumes

##==##

<!-- .slide: class="exercice"-->

## LAB
# Lab: Volumes

https://killercoda.com/sfeir-killercoda/scenario/8-volumes
