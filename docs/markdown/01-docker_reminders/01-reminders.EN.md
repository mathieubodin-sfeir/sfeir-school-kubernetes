<!-- .slide:-->

## Docker Reminders > **in a few points**

Docker is a containerization platform that allows you to create, deploy and run applications in isolated environments called containers.
* **Containers**: Lightweight units that contain everything the application needs to run.
* **Isolation**: Each container runs in an isolated manner.
* **Portability**: Containers can be run on any compatible system — development workstation, test server or production environment.

##==##

## Docker Reminders > **in a few points**

* **Efficiency**: Uses fewer resources than a VM, because it shares the host operating system kernel.
* **Speed**: Containers start and stop in seconds.
* **Reproducibility**: Docker guarantees that the application will work the same way across different environments.

##==##

<!-- .slide: class="flex-row" -->
## Docker Reminders > **VMs vs Containers**

![h-600](./assets/images/vms.png)
![h-600](./assets/images/containers.png)

* A VM requires a full OS; Docker uses the host system.
* Reduces resource usage and enables fast startup.
* Containers are immutable, unlike VMs.

Notes:

##==##

<!-- .slide:-->

## Docker Reminders > **Build & push**

![center h-400](./assets/images/docker.png)
* **Dockerfile**: Contains the instructions to build the image.
* **Image**: Contains the files required to run the application: binaries, dependencies, configuration.
* **Registry**: Public or private, used to retrieve images with the pull command.
