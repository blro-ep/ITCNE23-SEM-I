Open Source Monitoring
==== 

## Table of Content

* 01 - [Introduction Monitoring](#01-introduction-monitoring)
* 02 - [Project Overview](#02-project-overview)
* 03 - [Sources](#03-sources)
* 04 - [Applications](#04-applications)

## 01 Introduction Monitoring

## 02 Project Overview
![Draw](images/prometheus.drawio.png)

## 03 Sources
All monitoring components are open source.

### Podman
- [Podman](https://github.com/containers/podman.io)

### Docker Official Image
- [Prometheus](https://hub.docker.com/r/prom/prometheus)
- [Alertmanager](https://hub.docker.com/r/prom/alertmanager)
- [Blackbox-Exporter](https://hub.docker.com/r/prom/blackbox-exporter)
- [Grafana](https://hub.docker.com/r/grafana/grafana)

### Node Expoerter
- [Node-Exporter](https://github.com/prometheus/node_exporter)

### Git
- [Git](https://git-scm.com/download/linux)

### Multipass
For this project, Multipass is used for testing cloud-init. It's easier than on AWS's EC2 instances.
- [Mltipass](https://multipass.run/)


## 04 Applications
Short description of the monitoring applications.

### Prometheus
Prometheus is free software for service monitoring and real-time alerting of IT infrastructures. Prometheus queries real-time metrics from applications via HTTP and records them in a time-series database.

- Official site: [Prometheus](https://prometheus.io/docs/introduction/overview/)

### Node Exporter
The Prometheus Node Exporter exposes a wide variety of hardware- and kernel-related metrics.

- Offical site: [Node Exporter](https://prometheus.io/docs/guides/node-exporter/)

### Alertmanager
The Alertmanager handles alerts sent by client applications such as the Prometheus server. It takes care of deduplicating, grouping, and routing them to the correct receiver integrations such as email, PagerDuty, OpsGenie, or many other mechanisms thanks to the webhook receiver. It also takes care of silencing and inhibition of alerts.

- Official site: [Alertmanager](https://github.com/prometheus/alertmanager)

### Grafana
Grafana allows you to query, visualize, alert on and understand your metrics no matter where they are stored. Create, explore, and share dashboards with your team and foster a data driven culture.

- Offical site: [Grafana](https://grafana.com/oss/grafana/)

### Podman
Podman (Pod Manager) is a fully featured container engine. Podman provides a Docker-CLI comparable command line that eases the transition from other container engines and allows the management of pods, containers and images. 

- Official site: [Podman](https://podman.io/get-started)

### Git