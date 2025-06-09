# NGINX Reverse Proxy + Docker Compose + Multiple Apps

## Project Overview

In this project, we built a simple multi-container setup using Docker Compose. We deployed 3 simple Node.js apps (`app1`, `app2`, `app3`) and an NGINX container configured as a reverse proxy and load balancer.

We also explored how networking works inside Docker, and how containers communicate with each other versus how they communicate with the host machine.

---

## Architecture

* `app1`, `app2`, `app3`: Express servers exposing `port 3000` internally.
* `nginx`: Acts as a reverse proxy and load balancer for the apps, exposed on host port `8080`.
* All containers are connected to the same Docker Compose network: `nginx-crash-course_default`.

```
HOST
 |
 +--> localhost:8080 --> nginx --> app1/app2/app3 (load balanced)
 |
 +--> localhost:3000 --> connection refused (port not mapped)

Docker network "nginx-crash-course_default"
 |
 +--> app1:3000
 +--> app2:3000
 +--> app3:3000
 +--> nginx
 +--> test container (alpine)
```

---

## Key Learnings

### 1. NGINX as Reverse Proxy + Load Balancer

* We configured NGINX to load balance across `app1`, `app2`, `app3`.
* We validated this setup by refreshing the browser multiple times and observing requests being distributed among the apps.
* Each app logged which requests it received:

```
[App1] Received GET /
[App2] Received GET /
[App3] Received GET /
```

### 2. Docker Networking Model

* Docker Compose creates an internal network: `nginx-crash-course_default`.
* Containers can talk to each other by service name (`app1`, `app2`, `app3`).
* Ports `3000` were only **exposed** to the Docker network, not **published** to the host.
* That is why:

  * `curl app1:3000` works inside a container on the same network.
  * `curl localhost:3000` on the host fails (no port published).

### 3. Testing Internally with Alpine Container

* We ran an Alpine container inside the same network:

```bash
docker run -it --rm --network nginx-crash-course_default alpine sh
apk add --no-cache curl
curl -v http://app1:3000/
```

* This validated that Docker networking and container DNS resolution were working correctly.

### 4. Ports vs Expose

* `expose: "3000"` in Compose allows containers on the same network to communicate.
* To make `localhost:3000` on the host work, we would need `ports: "3001:3000"`, etc.
* In our case, we intentionally only exposed `nginx` on host port `8080`, as NGINX is the public entry point.

---

## 📸 App Preview
![App Homepage](public/images/homepage.png)

## Summary

We successfully built and tested:

* A multi-app architecture with NGINX reverse proxy.
* Load balancing across services.
* Deep understanding of Docker networking.
* Practical testing techniques using a temporary container.

---

## Next Steps (Optional)

* Add health checks for the apps in NGINX config.
* Add round-robin weights or other load balancing strategies.
* Add more apps or services.
* Monitor traffic using NGINX access logs.

---

## Conclusion

This exercise helped us learn **how to build a reverse-proxy-based architecture** and **understand container-to-container vs host-to-container networking** in Docker.

It also gave us practical troubleshooting skills (test with temporary containers, validate DNS resolution, understand `expose` vs `ports`).

Keep learning! 🚀
