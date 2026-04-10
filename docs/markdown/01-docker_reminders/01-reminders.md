<!-- .slide:-->

## Rappels sur Docker > **en quelques points**

Docker est une plateforme de conteneurisation qui permet de créer, déployer et exécuter des applications dans des environnements isolés appelés conteneurs.
* **Conteneurs** : Unités légères qui contiennent tout ce dont l'application a besoin pour fonctionner.
* **Isolation** : Chaque conteneur fonctionne de manière isolée.
* **Portabilité** : Les conteneurs peuvent être exécutés sur n'importe quel système compatible, poste de développement, serveur de test ou environnement de production.

##==##

## Rappels sur Docker > **en quelques points**

* **Efficacité** : Utilise moins de ressources qu'une VM, car partage le noyau du système d'exploitation hôte.
* **Rapidité** : Les conteneurs démarrent et s'arrêtent en quelques secondes.
* **Reproductibilité** : Docker garantit que l'application fonctionnera de la même manière dans différents environnements.

##==##

<!-- .slide: class="flex-row" -->
## Rappels sur Docker > **VM vs Containers**

![h-600](./assets/images/vms.png)
![h-600](./assets/images/containers.png)

* Une VM nécessite un OS entier, docker utilise le système hôte.
* Réduit les ressources utilisées, et permet un démarrage rapide.
* Les conteneurs sont immuables, contrairement aux VMs.

Notes:

##==##

<!-- .slide:-->

## Rappels sur Docker > **Build & push**

![center h-400](./assets/images/docker.png)
* **Dockerfile** : Contient les instructions pour construire l’image.
* **Image** : Contient les fichiers nécessaires à l’exécution de l'application : binaires, dépendances, configuration.
* **Registry** : Publique ou privée, permet de récupérer les images à l'aide de la commande pull.
