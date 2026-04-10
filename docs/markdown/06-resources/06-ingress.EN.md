<!-- .slide: class="transition"-->

# Resources
## Ingress

##==##

<!-- .slide:-->

# Resources > **Ingress**

![center h-900](./assets/images/resource-ing.png)

##==##

<!-- .slide: class="two-column with-code-bg-dark" -->

# Resources > Ingress > **Definition**

**Definition:** Kubernetes resource managing external access to services via HTTP/HTTPS. They act as an entry point for network traffic, offering routing features.
* **Routing:** Direct traffic to different services based on URL or hostname.
* **SSL/TLS:** Handles SSL/TLS termination to secure connections.
* **Name-based virtual hosting:** Allows hosting multiple domains on a single IP address.
* **Controller:** Requires an Ingress Controller (such as Nginx, Traefik, HAProxy) to function.

##==##

<!-- .slide: class="two-column with-code-bg-dark" -->

# Resources > Ingress > **Example**

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

Here is an Ingress resource that exposes the school application through the URL https://school.mydomain.com
* **tls:** Uses the certificate present in the school-tls secret to expose the application over HTTPS.
* **host:** Expected FQDN to redirect traffic to the associated service.
* **path:** Allows managing sub-paths (/api redirected to the api microservice).
* **backend:** Specifies the service to which traffic should be redirected.

Notes:

##==##

<!-- .slide:-->

# Resources > Ingress > **Limitations**

* **Frozen API:** The Ingress API no longer receives any updates or new features.
* **HTTP/HTTPS only:** No native support for TCP, UDP or gRPC.
* **Non-portable annotations:** Advanced features (header-based routing, traffic splitting) require controller-specific annotations.
* **No role separation:** The same resource is managed by both infrastructure teams and application developers.
* **Kubernetes officially recommends migrating to the Gateway API.**

##==##

<!-- .slide: class="transition"-->

# Resources
## Gateway API

##==##

<!-- .slide:-->

# Resources > **Gateway API**

**Definition:** The official successor to Ingress, the Gateway API is a family of Kubernetes resources (CRDs) offering advanced traffic routing and dynamic infrastructure.

* **Role-oriented:** Clearly separates responsibilities between infra provider, cluster operator and developer.
* **Expressive:** Header-based routing, traffic splitting, gRPC — all natively, without annotations.
* **Portable:** Standardized specification, supported by many implementations (Cilium, Istio, Nginx, Traefik, Kong…).
* **Stable (GA):** `gateway.networking.k8s.io/v1` — GatewayClass, Gateway, HTTPRoute and GRPCRoute are stable.
* **Separate installation:** CRDs are not included in the Kubernetes core.

##==##

<!-- .slide: class="two-column" -->

# Resources > Gateway API > **Resources**

![center](./assets/images/gateway-api-resource-model.png)

##--##

<br><br>

**3-role model:**
* **GatewayClass:** Defines available implementations. Managed by the infrastructure team.
* **Gateway:** Instantiates an entry point (HTTP/HTTPS/TCP listeners). Managed by the cluster operator.
* **HTTPRoute / GRPCRoute:** Application routing rules (path, header, weights). Managed by the developer.

This model enables **fine-grained delegation**: a Gateway can restrict which namespaces can attach routes to it.

##==##

<!-- .slide: class="two-column with-code-bg-dark" -->

# Resources > Gateway API > **Example — Gateway**

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

* **`infra` namespace**: The Gateway resource is managed by the infrastructure team, separately from applications.
* **gatewayClassName**: References the implementation to use (here Nginx).
* **listeners**: Defines the listening point — port 443 over HTTPS with TLS termination via the `school-tls` secret.
* **allowedRoutes**: Allows routes from all namespaces in the cluster.

##==##

<!-- .slide: class="two-column with-code-bg-dark" -->

# Resources > Gateway API > **Example — HTTPRoute**

* **`app` namespace**: The HTTPRoute resource is managed by the developer, in a separate application namespace.
* **parentRefs**: Attaches this route to the `school-gateway` Gateway defined in the `infra` namespace.
* **rules**: Two routing rules — `/api` to service `api-svc`, `/` to `school-svc`.
* **Role separation**: infra and application are managed independently.

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

# Resources > Gateway API > **Ingress vs Gateway API**

| | **Ingress** | **Gateway API** |
|---|---|---|
| Status | Stable, **frozen API** | GA (v1), actively developed |
| Protocols | HTTP / HTTPS only | HTTP, HTTPS, gRPC, TCP, UDP |
| Advanced routing | Via annotations (non-portable) | Native in the spec |
| Role separation | None | 3 levels (class / gateway / route) |
| Multi-tenancy | Limited | Native (`allowedRoutes`) |
| Portability | Low | High |
| Recommendation | Migrate to Gateway API | Official successor to Ingress |

Notes:
