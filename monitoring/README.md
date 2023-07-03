# Monitoring

![Prometheus](images/prometheus-icon.png)

## Table of conten
* 1       - [Summary](#1-summary)
* 2       - [Introduction](#2-introduction)
* 2.1     - [Initial-Position](#21-initial-position)
* 2.2     - [Mission](#22-mission)
* 2.2.1   - [Monitoring Overview](#221-monitoring-overview)
* 2.3     - [Sources](#23-sources)
* 2.3.1   - [Podman](#231-podman)
* 2.3.1.1 - [Podman-Compose](#2311-podman-compose)
* 2.3.2   - [Docker Images](#232-docker-official-image)
* 2.3.3   - [Node-Exporter](#233-node-exporter)
* 2.3.4   - [Apache-Exporter](#234-apache-exporter)
* 2.3.5   - [Multipass](#235-multipass)
* 2.3.6   - [git](#236-git)
* 2.3.7   - [Drawio](#237-drawio)
* 3       - [SEUSAG](#3-seusag)
* 3.1     - [System Boundary / Interface](#31-system-boundary--interface)
* 3.2     - [Influencing Factors](#32-influencing-factors)
* 3.3     - [Sub- and Partsystems](#33-sub--and-part-systems)
* 3.4     - [System Boundary](#34-system-boundary)
* 3.5     - [Influencing Factors and Restrictions](#35-influencing-factors-and-restrictions)
* 3.6     - [Subsystem](#36-subsystem)
* 3.7     - [Inferfaces](#37-interfaces)
* 3.7.1   - [Portmatrix](#371-portmatrix)
* 4       - [Project Goals](#4-project-goals)
* 4.1     - [Procedural Goals](#41-procedural-goals)
* 4.2     - [System Golas](#42-system-goals)
* 5       - [Appreciation](#5-appreciation-swot-analysis)
* 5.1     - [Strengths](#51-strengths)
* 5.2     - [Weaknesses](#52-weaknesses)
* 5.3     - [Opportunities](#53-opportunities)
* 5.4     - [Threats](#54-threats)
* 6       - [Testing](#6-testing)
* 6.1     - [Update Mail Setting](#61-update-gmail-settings)
* 6.2     - [Check Admin UI's](#62-check-admin-uis)
* 6.3     - [Podman](#63-podman)
* 6.3.1   - [Podman Compose](#631-podman-compose)
* 6.4     - [stress-ng](#64-stress-ng)
* 6.4.1   - [CPU load](#641-cpu-load)
* 6.4.2   - [Memory load](#642-memory-load)
* 6.5     - [Apache service](#65-apache-stop-start)
* 6.6     - [Reload Prometheus Config](#66-reload-prometheus-config)
* 6.7     - [Check Prometheus Exporter](#67-check-prometheus-exporter)
* 7       - [Projectmanagement](#7-projectmanagement)
* 8       - [Projectconclusion](#8-projectconclusion)
* 8.1     - [Monitoring](#81-monitoring)
---

## 1 Summary

| <div style="width:122px">Projectname</div> | ITCNE23-SEM-I |
|---|---|
| Subproject name | Monitoring  |
| Project lecturer | Rohr Philipp |
| Subject lecturer | Calisto Marcello |
| Subproject leader | Roger Blum  |
| Initial position | With this semester work, a monitoring should be made available, which can be automatically started up in the AWS-Cloud and can be used for existing and new servers. |
| Goals  | Automated installation of the monitoring components using Cloud-Init <br><br>Dashboard for EC2 Instances / Apache<br><br>Alerting based on defined threshold values via email<br><br>Setup of monitoring via Github<br><br>Integration into sub-project (ICA) from Dany Ambühl |
| Task | The software is operated using containers, which are managed using prodman based on the POC <br><br>Resource planning and tasks are planned in github<br><br> |

---

## 2 Introduction

### 2.1 Initial position
Cloud computing" is the on-demand delivery of IT resources over the Internet at pay-as-you-go prices. Instead of purchasing, owning, and maintaining physical data centers and servers, you can access technology services on an as-needed basis through a cloud provider such as Amazon Web Services (AWS). such as computing power, memory and databases.

AWS offers monitoring by default, which can only be adapted to your own needs to a limited extent.

### 2.2 Mission
As part of this semester work, an open source monitoring solution is to be made available.
The solution can be made available in the AWS cloud with simple steps and can be adapted to individual needs.

#### 2.2.1 Monitoring Overview
![Draw](images/prometheus.drawio.png)

### 2.3 Sources
Different software is used for this project. The link to the source can be found in the list below.<br>
A short software description and a link to the official website can be found in point [3.6 Subsystem](#36-subsystem).

#### 2.3.1 Podman
- [Podman](https://github.com/containers/podman.io)

##### 2.3.1.1 Podman-compose
- [Podman-Compose](https://github.com/containers/podman-compose)

#### 2.3.2 Docker Official Image
- [Prometheus](https://hub.docker.com/r/prom/prometheus)
- [Alertmanager](https://hub.docker.com/r/prom/alertmanager)
- [Blackbox-Exporter](https://hub.docker.com/r/prom/blackbox-exporter)
- [Grafana](https://hub.docker.com/r/grafana/grafana)

#### 2.3.3 Node Exporter
- [Node-Exporter](https://github.com/prometheus/node_exporter)

#### 2.3.4 Apache Exporter
- [Apache-Exporter](https://github.com/Lusitaniae/apache_exporter)

#### 2.3.5 Multipass
- [Mltipass](https://multipass.run/)

#### 2.3.6 Git
- [Git](https://git-scm.com/download/linux)

#### 2.3.7 Draw.io
- [Draw.io](https://github.com/jgraph/drawio-desktop)

---

## 3. SEUSAG

### 3.1 System boundary / Interface
![System boundary](images/system-boundary.drawio.png)

### 3.2 Influencing factors
![Influencing factors](images/influencing-factors.drawio.svg)

### 3.3 Sub- and part systems
![Sub- and part systems](images/sub-part-systems.drawio.png)

### 3.4 System boundary
The following elements that are directly related to the monitoring have been included within the system boundary.
- Podman
- Prometheus
- Alertmanager
- Blackbox-Exporter
- Grafana
- Cloud-init

The following elements are not directly related to the monitoring and were defined outside the system boundary.
- Cloud Provider
- Mail Provider 
- EC2 Instances
- Github
- Exporter

### 3.5 Influencing factors and restrictions
The project is limited to the installation and execution of the monitoring software.

| number | factor | restrictions |
|---|---|---|
| E1 | Cloud Provider | Die Monitoring Software installation mit cloud-init ist Provider neutral.<br>Es wurde für die AWS sowie Multipass getestet. |
| E2 | Sub Project IaC | The monitoring also works independently.<br>However, there is a dependency in relation to the overall project.<br>The risk can be extremely minimized in close cooperation with Dany Ambühl (subproject IaC). |
| E3 | Lecturer TBZ | The lecturers check the project for content and function and can instruct it to be aborted. The risk can be minimized by regular comparison with the lecturers. |
| E4 | Software | Open source products are used to operate the monitoring software.<br> To minimize the risk, all software could be downloaded additionally.<br>However, this measure is waived. |

### 3.6 Subsystem
#### 3.6.1 Prometheus
Prometheus is free software for service monitoring and real-time alerting of IT infrastructures. Prometheus queries real-time metrics from applications via HTTP and records them in a time-series database.

- Official site: [Prometheus](https://prometheus.io/docs/introduction/overview/)

#### 3.6.2 Node Exporter
The Prometheus Node Exporter exposes a wide variety of hardware- and kernel-related metrics.

- Offical site: [Node Exporter](https://prometheus.io/docs/guides/node-exporter/)

#### 3.6.3 Alertmanager
The Alertmanager handles alerts sent by client applications such as the Prometheus server. It takes care of deduplicating, grouping, and routing them to the correct receiver integrations such as email, PagerDuty, OpsGenie, or many other mechanisms thanks to the webhook receiver. It also takes care of silencing and inhibition of alerts.

- Official site: [Alertmanager](https://github.com/prometheus/alertmanager)

#### 3.6.4 Grafana
Grafana allows you to query, visualize, alert on and understand your metrics no matter where they are stored. Create, explore, and share dashboards with your team and foster a data driven culture.

- Offical site: [Grafana](https://grafana.com/oss/grafana/)

#### 3.6.5 Podman
Podman (Pod Manager) is a fully featured container engine. Podman provides a Docker-CLI comparable command line that eases the transition from other container engines and allows the management of pods, containers and images. 

- Official site: [Podman](https://podman.io/get-started)

*At the suggestion of the lecturer Calisto Marcello, Docker was replaced with Podman.*

#### 3.6.6 Github
GitHub is an Internet hosting service for software development and version control using Git. It provides the distributed version control of Git plus access control, bug tracking, software feature requests, task management, continuous integration, and wikis for every project.

Github is used in this project to manage the monitoring setup.

- Official site: [github](https://github.com/)

### 3.7 Interfaces
| Schnittstelle | <div style="width:175px">Element</div> | Description |
|---------------|---------|-------------|
| S1 | Prometheus / Blackbox-Exporter |Prometheus pulls the metrics from the Blackbox-Exporter and stores them in its time series database.|
| S2 | Grafana / Prometheus | Grafana reads the metrics form time series database from prometheus, this data can be presented graphically in the form of a dashboard.|
| S3 | Promethes / Alertmanager | Prometheus pushes the alerts to the alert manager, from where they are sent. |

#### 3.7.1 Portmatrix

| Application | Port | Direction |
|---|---|---|
| Prometheus | 9090 | inbound |
| Node Exporter | 9100 |  inbound |
| Blackbox Exporter | 9115 | inboud |
| Alertmanager | 9093 | inbound |
| Grafan |  3000 | inbound |
| SSH | 22 | inbound |
| http | 80 | outbound |
| https | 443 | outbound |
| smtp | 587 | outbound |

---

## 4. Project goals

### 4.1 Procedural goals

| Goals | Dates |
|---|---|
|Shared github repository with Dany Ambühl, enabling agile collaboration.The repository should be public. This means that the current status can be understood at any time and the project planning / project progress can be seen. | Sprint 1 |

### 4.2 System goals

| Goals | Dates |
|---|---|
|The software components are installed on an AWS EC2 instance using cloud-init. | Sprint 1 |
|Dashboard for EC2 Instances, which provides information about CPU, Memory, Disk usage. The Dashobard should be accessible from the Internet and be able to be customized.| Sprint 2 |
|Dashboard for Apache Service, which shows the availability of the service (http status code, http duration). The Dashobard should be accessible via the Internet and be able to be individually adjusted. | Sprint 2 |
|Alerting based on defined threshold values by e-mail (Fring / Resolved).| Sprint 3 | 

## 5. Appreciation (SWOT-Analysis)

### 5.1 Strengths
- No license costs due to open source products
- Easy installation due to cloud-init
- Provider independent

### 5.2 Weaknesses
- Cloud-init only tested on Ubuntu 22.04
- Cloud-init code for Debian derivatives only

### 5.3 Opportunities
- Improving AWS know-how through the IaC Project from Dany
- Improving know-how for project management with Github
- Gained know-how can be used in business

### 5.4 Threats
- Monitoring setup is too static (IP addresses)
- There is not enough time for project management and practical implementation
- The two projects Iac / Monitoring do not work together

---

## 6. Testing
### 6.1 Update Gmail Settings
Set email address and password.
```
sudo sed -i "s/xxx@gmail.com/<<MAILADDRESS>>/g" /opt/ITCNE23-SEM-I/monitoring/alertmanager/alertmanager.yml

sudo sed -i "s/xxxxxxxxxxx/<<PASSWORD>>/g" /opt/ITCNE23-SEM-I/monitoring/alertmanager/alertmanager.yml
```
### 6.2 Check Admin UI's
Check if the Admin UI is reachable.

| Application | URL | Port |
|---|---|---|
|Prometheus|http://"*loadbalancer-address-from-AWS*"|9090|
|Grafana|http://"*loadbalancer-address-from-AWS*"|3000|
|Alertmanager|http://"*loadbalancer-address-from-AWS*"|9093|
|Blackbox-Exporter|http://"*loadbalancer-address-from-AWS*"|9115|
### 6.3 Podman
Basic commands for podman.
```
# show running containers.
sudo podman ps

# show all containers regardless of status
sudo podman ps -a

# show logs from a container, example prometheus
sudo podman logs prometheus

# change in running container, example prometheus
sudo podman exec -it prometheus /bin/sh

# show container images
sudo podman images

# list volumens
sudo podman volume ls

# display a container, image, volume, network, or pod’s configuration, example prometheus
sudo podman inspect prometheus

# connect into a container
sudo podman exec -it grafana /bin/sh
```

#### 6.3.1 Podman-Compose
Basic commands for podman, change into the Compose YAML directory
```
# change directory
cd /opt/ITCNE23-SEM-I/monitoring/podman/

# restart all containers
sudo podman-compose restart

# restart a single container, example prometheus
sudo podman-compose restart prometheus

# stop all container
sudo podman-compose stop

# start all container, option -d starts the container in the background, detaching it from the current shell
sudo podman-compose up -d
```
### 6.4 stress-ng
The stress-ng tool is used to generate load on the server for testing.
#### 6.4.1 CPU Load
```
sudo stress-ng -c 0 -l 90 -t 3m &
```
#### 6.4.2 Memory Load
```
sudo stress-ng --vm 1 --vm-bytes 384M --timeout 3m &
```
### 6.5 Apache stop/ start
```
sudo systemctl stop apache2.service
sudo systemctl status apache2.service
```
### 6.6 Reload Prometheus Config
Reload Prometheus configuration without container restart.
```
curl -X POST http://localhost:9090/-/reload
```

### 6.7 Check prometheus exporter
```
systemctl status prometheus-node-exporter
```

## 7. Projectmanagement
The project management documentation can be found under the following link:
- [**Project Documentation**](../project/README.md)

## 8. Projectconclusion
Semester thesis TBZ Cloud-native Engineer, class ITCNE 23, 1st semester.

Project IaC deployment with AWS CloudFormation and integrated monitoring. 
Collaboration Dany Ambühl / Roger Blum.

### 8.1 Monitoring
The goal was to provide monitoring that can be started up automatically within Dany Ambühl's IaC project.
Most of the automation is done via cloud-init, which is used to start up the instance with the required container.
The setup of the containers is stored in the Github repo and is updated and read out during the creation of the instance.
According to the project application, the containers should be administered using Docker. At the suggestion of the lecturer Marcello Calisto, Docker was replaced by Podman. This was a good decision, as Podman will replace Docker in the long term. Through this adjustment, I learned that Docker images are compatible with Podman. Most Docker and Podman commands are identical, so existing know-how could be carried over. 
One challenge was the Podman Compose version, which is included in the current Ubuntu package repositories. This led to a problem when restarting the container, which is why a new version is installed via cloud-init.

The know-how gained in the course of the project regarding IaC and jinja-template has contributed to the automation of the solution and has led to constant optimization. The IP address in the conig files could be updated using cloud-init. By updating the IP address, it became possible to automate the addition of the Grafana DataSource and the dashboards.

The DataSource is automated via Grafana API. A curl post is sent in cloud-init, which transfers the configuration in the form of a json file.
The dashboards are imported using Grafana Provision, which resulted in an adaptation of Podman-Compose. I invested a lot of time here until I understood the concept and set the volumes of the Grafana container correctly. A major advantage is that Dashboard can be added automatically during operation (save the json file in the correct directory). 

The credentials for sending emails from Alertmanger presented a major challenge. I didn't want to put this information in the public github repo. 
A solution was found with the AWS Secret Manager (Roles / Policies). This has been successfully tested and documented.
Unfortunately, there was not enough time for the integration into Dany's IaC project. So this remains a manual step.

The implementation of the project and the collaboration with Dany Ambühl were very instructive and fun.