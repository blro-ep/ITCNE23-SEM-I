# Monitoring

![Prometheus](images/prometheus-icon.png)

## Table of conten
* 1     - [Summary](#1-summary)
* 2     - [Introduction](#2-introduction)
* 2.1   - [Initial-Position](#21-initial-position)
* 2.2   - [Mission](#22-mission)
* 2.3   - [Sources](#23-sources)
* 2.3.1 - [Podman](#231-podman)
* 2.3.2 - [Docker Images](#232-docker-official-image)
* 2.3.3 - [Node-Exporter](#233-node-exporter)
* 2.3.4 - [Apache-Exporter](#234-apache-exporter)
* 2.3.5 - [Multipass](#235-multipass)
* 2.3.6 - [git](#236-git)
* 2.3.7 - [Drawio](#237-drawio)
* 3     - [SEUSAG](#3-seusag)
* 3.1   - [System Boundary / Interface](#31-system-boundary--interface)
* 3.2   - [Influencing Factors](#32-influencing-factors)
* 3.3   - [Sub- and Partsystems](#33-sub--and-part-systems)
* 3.4   - [System Boundary](#34-system-boundary)
* 3.5   - [Influencing Factors and Restrictions](#35-influencing-factors-and-restrictions)
* 3.6   - [Subsystem](#36-subsystem)
* 3.7   - [Inferfaces](#37-interfaces)
* 3.7.1 - [Portmatrix](#371-portmatrix)
* 4     - [Project Goals](#4-project-goals)
* 4.1   - [Procedural Goals](#41-procedural-goals)
* 4.2   - [System Golas](#42-system-goals)
* 5     - [Appreciation](#5-appreciation-swot-analysis)
* 5.1   - [Strengths](#51-strengths)
* 5.2   - [Weaknesses](#52-weaknesses)
* 5.3   - [Opportunities](#53-opportunities)
* 5.4   - [Threats](#54-threats)
* 6     - [Project Planning](#6-project-planning)
* 6.1   - [Project Management Tools](#61-projectmanagement-tools)
* 6.2   - [Tasks](#62-tasks)
* 7     - [Glossar](#7-glossar)

---

## 1 Summary

| <div style="width:125px">Projectname</div> | ITCNE23-SEM-I |
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

### 2.2 Mission
Project Overview
![Draw](images/prometheus.drawio.png)

### 2.3 Sources
Different software is used for this project. The link to the source can be found in the list below.<br>
A short software description and a link to the official website can be found in point [3.6 Subsystem](#36-subsystem).

#### 2.3.1 Podman
- [Podman](https://github.com/containers/podman.io)

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
![System boundary](images/system-boundary.svg)

### 3.2 Influencing factors
![Influencing factors](images/influencing-factors.drawio.svg)

### 3.3 Sub- and part systems
![Sub- and part systems](images/sub-part-systems.drawio.svg)

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
| E1 | Cloud Provider | Die Monitoring Software installation mit cloud-init ist Provider neutral.
Es wurde für die AWS sowie Multipass getestet. |
| E2 | Sub Project IaC | The monitoring also works independently.
However, there is a dependency in relation to the overall project.
The risk can be extremely minimized in close cooperation with Dany Ambühl (subproject IaC). |
| E3 | Lecturer TBZ | The lecturers check the project for content and function and can instruct it to be aborted. The risk can be minimized by regular comparison with the lecturers. |
| E4 | Software | Open source products are used to operate the monitoring software.
To minimize the risk, all software could be downloaded additionally. However, this measure is waived. |

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

#### 3.6.6 Github
GGitHub is an Internet hosting service for software development and version control using Git. It provides the distributed version control of Git plus access control, bug tracking, software feature requests, task management, continuous integration, and wikis for every project.

Github is used in this project to manage the monitoring setup.

- Official site: [github](https://github.com/)

### 3.7 Interfaces
| Schnittstelle | <div style="width:175px">Element</div> | Description |
|---------------|---------|-------------|
| S1 | Prometheus / Blackbox-Exporter |Prometheus pulls the metrics from the Blackbox-Exporter and stores them in its time series database.|
| S2 | Grafana / Prometheus | Grafana reads the metrics form time series database from prometheus, this data can be presented graphically in the form of a dashboard.|
| S3 | Promethes / Alertmanager | Prometheus pushes the alerts to the alert manager, from where they are sent. |

#### 3.7.1 Portmatrix

| Application | DST | SRC | Port | INT/EXT |
|---|---|---|---|---|
| Prometheus |  2 |  3 | 9090 | intern |
| Node Exporter|   |   | 9100 |  intern |
| Blackbox Exporter |   |  | 9115 | intern |
| Alertmanager |   |  | 9093 | intern |
| Grafan |   |   |  3000 | extern |
| res |  |  |   |   |
| res |  |  |   |   |

---

## 4. Project goals

### 4.1 Procedural goals

### 4.2 System goals

---

## 5. Appreciation (SWOT-Analysis)

### 5.1 Strengths

### 5.2 Weaknesses

### 5.3 Opportunities

### 5.4 Threats

---

## 6. Project planning
Agile project management is used for project planning. We use the tools provided by Github.

### 6.1 Projectmanagement tools
We use the following project management tools.
- Kanbanboard
- Roadmap
- Tasklist

 These are available in the following public Github repository.
 - [@TBZ-SemesterWork](https://github.com/users/blro-ep/projects/4)

### 6.2 Tasks
We have defined additional fields for planning.
- Status
  - Todo - This item hasn't been started
  - In Progress - This is actively being worked on
  - Done - This has been completed
  - Backlog - List of tasks still to be scheduled
- Priority
  - A - Must Do, high priority, very important, critical items, with close deadlines or high level importance to them
  - B - Should Do, medium priority, quite important over time , not as critical as “A” items, but still important to spend time doing.
  - C - Nice To Do, low priority at this time, low consequences if left undone at this moment.
- Start Date
  - Start Date of a Task
- End Date
  - End Date of a Task

---  

## 7. Glossar



