<!-- .slide: class="transition"-->

# Les ressources
## Ingress

##==##

<!-- .slide:-->

# Les ressources > **Ingress**

![center h-900](./assets/images/resource-ing.png)

##==##

<!-- .slide: class="two-column with-code-bg-dark" -->

# Les ressources > Ingress > **Définition**

**Définition:** Ressource Kubernetes gérant l'accès externe aux services via HTTP/HTTPS. Ils agissent comme un point d'entrée pour le trafic réseau, offrant des fonctionnalités de routage.
* **Routage:** diriger le trafic vers différents services basés sur l'URL ou le nom d'hôte.
* **SSL/TLS:** Gère la terminaison SSL/TLS pour sécuriser les connexions.
* **Name-based virtual hosting:** Permet d'héberger plusieurs domaines sur une seule adresse IP.
* **Controller:** Nécessite un Ingress Controller (comme Nginx, Traefik, HAProxy) pour fonctionner.

##==##

<!-- .slide: class="two-column with-code-bg-dark" -->

# Les ressources > Ingress > **Exemple**

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: school-ingress
spec:
  tls:
  - hosts:
      - school.mydomain.com
    secretName: school-tls
  rules:
  - host: school.mydomain.com
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: school-svc
            port:
              number: 80
```

##--##

<br><br>

Voici une ressource ingress qui expose l'application school au travers de l'url https://school.mydomain.com
* **tls:** Utilise le certificat présent dans le secret school-tls pour exposer l'application en HTTPS.
* **host:** FQDN attendu pour rediriger le trafic vers le service associé.
* **path:** Permet de gérer les sous chemins (/api redirigé vers le microservice api).
* **backend:** Spécifie le service vers lequel rediriger le trafic.

Notes: 
Presentation Nicolas

##==##

<!-- .slide:-->

# Les ressources > Ingress > **Limitations**

* **API gelée :** L'API Ingress ne reçoit plus aucune mise à jour ou nouvelle fonctionnalité.
* **HTTP/HTTPS uniquement :** Pas de support natif pour TCP, UDP ou gRPC.
* **Annotations non-portables :** Les fonctionnalités avancées (routage par header, traffic splitting) nécessitent des annotations spécifiques à chaque controller.
* **Aucune séparation des rôles :** La même ressource est gérée à la fois par les équipes infra et les développeurs applicatifs.
* **Kubernetes recommande officiellement de migrer vers la Gateway API.**

##==##

<!-- .slide: class="transition"-->

# Les ressources
## Gateway API

##==##

<!-- .slide:-->

# Les ressources > **Gateway API**

**Définition :** Successeur officiel d'Ingress, la Gateway API est une famille de ressources Kubernetes (CRDs) offrant un routage de trafic avancé et une infrastructure dynamique.

* **Orientée rôles :** Sépare clairement les responsabilités entre infra provider, cluster operator et développeur.
* **Expressive :** Routage par header, traffic splitting, gRPC — tout en natif, sans annotation.
* **Portable :** Spécification standardisée, supportée par de nombreuses implémentations (Cilium, Istio, Nginx, Traefik, Kong…).
* **Stable (GA) :** `gateway.networking.k8s.io/v1` — GatewayClass, Gateway, HTTPRoute et GRPCRoute sont stables.
* **Installation séparée :** Les CRDs ne sont pas incluses dans Kubernetes core.

##==##

<!-- .slide: class="two-column" -->

# Les ressources > Gateway API > **Ressources**

![center](./assets/images/gateway-api-resource-model.png)

##--##

<br><br>

**Modèle des 3 rôles :**
* **GatewayClass :** Définit les implémentations disponibles. Géré par l'équipe infrastructure.
* **Gateway :** Instancie un point d'entrée (listeners HTTP/HTTPS/TCP). Géré par le cluster operator.
* **HTTPRoute / GRPCRoute :** Règles de routage applicatives (path, header, poids). Géré par le développeur.

Ce modèle permet une **délégation fine** : un Gateway peut restreindre quels namespaces peuvent y attacher des routes.

##==##

<!-- .slide: class="two-column with-code-bg-dark" -->

# Les ressources > Gateway API > **Exemple — Gateway**

```yaml
apiVersion: gateway.networking.k8s.io/v1
kind: Gateway
metadata:
  name: school-gateway
  namespace: infra
spec:
  gatewayClassName: nginx
  listeners:
  - name: https
    protocol: HTTPS
    port: 443
    hostname: "school.mydomain.com"
    tls:
      certificateRefs:
      - name: school-tls
    allowedRoutes:
      namespaces:
        from: All
```

##--##

<br><br>

* **namespace `infra`** : La ressource Gateway est gérée par l'équipe infrastructure, séparément des applications.
* **gatewayClassName** : Référence l'implémentation à utiliser (ici Nginx).
* **listeners** : Définit le point d'écoute — port 443 en HTTPS avec terminaison TLS via le secret `school-tls`.
* **allowedRoutes** : Autorise les routes depuis tous les namespaces du cluster.

##==##

<!-- .slide: class="two-column with-code-bg-dark" -->

# Les ressources > Gateway API > **Exemple — HTTPRoute**

* **namespace `app`** : La ressource HTTPRoute est gérée par le développeur, dans un namespace applicatif distinct.
* **parentRefs** : Attache cette route au Gateway `school-gateway` défini dans le namespace `infra`.
* **rules** : Deux règles de routage — `/api` vers le service `api-svc`, `/` vers `school-svc`.
* **Séparation des rôles** : l'infra et l'applicatif sont gérés indépendamment.

##--##

```yaml
apiVersion: gateway.networking.k8s.io/v1
kind: HTTPRoute
metadata:
  name: school-route
  namespace: app
spec:
  parentRefs:
  - name: school-gateway
    namespace: infra
  hostnames:
  - "school.mydomain.com"
  rules:
  - matches:
    - path:
        type: PathPrefix
        value: /api
    backendRefs:
    - name: api-svc
      port: 8080
  - matches:
    - path:
        type: PathPrefix
        value: /
    backendRefs:
    - name: school-svc
      port: 80
```

##==##

<!-- .slide:-->

# Les ressources > Gateway API > **Ingress vs Gateway API**

| | **Ingress** | **Gateway API** |
|---|---|---|
| Statut | Stable, **API gelée** | GA (v1), en développement actif |
| Protocoles | HTTP / HTTPS uniquement | HTTP, HTTPS, gRPC, TCP, UDP |
| Routage avancé | Via annotations (non-portable) | Natif dans la spec |
| Séparation des rôles | Aucune | 3 niveaux (class / gateway / route) |
| Multi-tenancy | Limité | Natif (`allowedRoutes`) |
| Portabilité | Faible | Élevée |
| Recommandation | Migrer vers Gateway API | Successeur officiel d'Ingress |

Notes:
La Gateway API est installée séparément via ses CRDs : elle n'est pas incluse dans Kubernetes par défaut.
Implémentations populaires : Cilium, Envoy Gateway, Istio, Nginx, Traefik, Kong, GKE.