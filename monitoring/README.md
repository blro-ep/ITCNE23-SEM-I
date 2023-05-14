# Monitoring

![Prometheus](images/prometheus-icon.png)

## Table of conten




## 1 Summary

| Projectname  | ITCNE23-SEM-I |
|---|---|
| Subproject name | Monitoring  |
| Project lecturer | Rohr Philipp |
| Subject lecturer | Calisto Marcello |
| Subproject leader | Roger Blum  |
| Initial position | With this semester work, a monitoring should be made available, which can be automatically started up in the AWS-Cloud and can be used for existing and new servers. |
| Goals  | Automated installation of the monitoring components using Cloud-Init <br><br>Dashboard for EC2 Instances / Apache<br><br>Alerting based on defined threshold values via email<br><br>Setup of monitoring via Github<br><br>Integration into sub-project (ICA) from Dany Ambühl |
| Task | The software is operated using containers, which are managed using prodman based on the POC <br><br>Resource planning and tasks are planned in github<br><br> |

## 2 Introduction

### 2.1 Initial position

### 2.2 Mission
Project Overview
![Draw](images/prometheus.drawio.png)

### 2.3 Sources
All monitoring components are open source.

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

#### 2.3.6 Multipass
For this project, Multipass is used for testing cloud-init. It's easier than on AWS's EC2 instances.
- [Mltipass](https://multipass.run/)

#### 2.3.5 Git
- [Git](https://git-scm.com/download/linux)

## 3. SEUSAG

### 3.1 System boundary / Interface

### 3.2 Influencing factors

### 3.3 Sub- and part systems

### 3.4 System boundary

### 3.5 Influencing factors and restrictions

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

## 4. Project goals

### 4.1 Procedural goals

### 4.2 System goals

## 5. SWOT-Analyse

### 5.1 Strengths

### 5.2 Weaknes

### 5.3 Oportunities

### 5.4 Threats

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

## 7. Glossar



