Definition Lean / Agile Project
==== 

Roger stellt die User data für Grafana und DB Server berreit. 

Implemenatin User Data to ec2 über github -> Dany 

## Table of Content

* 01 - [Our Kanban Board Explained](#01-Our-Kanban-Board-Explained)
* 02 - [Communication Collaboration](#02-Communication-Collaboration)
* 03 - [Testing](#03-Testing)

## 01 Our Kanban Board Explained
In order to visualize and manage our workflow in agile project, we are going to use the kanban board directly in Github as our project management tool.
The aim is to have a clear and visual representation of the entire workflow, allowing us to easily see the status of all the tasks and help to improve the collaboration and communication. 

We choose a lean and simple kanban board design, where the following columns represent the different stages/process of the project.

```
- Todo
- In Progress
- Done 
- Backlog
```

![Kanbandboard](images/kanbanboard.png)

When there is a new task or work item that needs to be completed, we first open a new "issue" in the ITCNE23-SEM-1 Github repository. 

In this "issue" we contain information about the task, such as its Title, assignees, label, milestone, priority, start date, end date and any notes or details related to the task.

![issue](images/kanbanissue.png)

We have defined four different labels that are used to indicate what type of category the kanban card is in.

```
- documentation       - Improvements or additions to documentation 
- iac                 - Infrastructure as Code 
- monitoring          - POC Monitoring 
- project             - Agile Project 
```

In order to ensure that the project is on track and to measure its progress, we have defined four milestones.

```
- 1.Sprint            - Project kickoff finished, Individual tasks started iac and monitoring 
- 2.Sprint            - Definition and implementation of the dependencies and first testings iac - monitoring 
- 3.Sprint            - Finish prio A tasks, join the two project and extensive testing
- 4.Sprint            - Conclusion, Work acceptance and Presentation
```

When the "issue" is opened, it automatically appears in the kanban board "Todo" column.

From there, we can then move the card to the "In Progress" column to show that we are actively working on it.

When the task has been completed, we can move the card to the "Done" column to indicate that it has been completed. You will also be able to add any additional notes or comments about the task or issues that arose.

The "Backlog" column can be seen as a holding area for tasks that are waiting to be added to the board or moved to the "To Do" column. It is a useful tool for planning future work and ensure for a steady flow of tasks moving through the workflow. 

### Sprint completion
- 1. Sprint / 15.05.2023
![1.Sprint](images/sprint-1.png)

**Keep**
Die Entscheidung das Projekt in Github zu Dokumentieren war sehr gut. 
Das Projekt konnte in einzelen Task aufgeteilt werden und bietet mit dem Kanbanboard, Roudmap, Taskliste eine gute und schnelle übersicht zum Projekt.
Durch github kann unabhänging von einander am Projekt gearbeitet werden und sämtliche Schritte können mit den Commits nachvollzogen werden.
Die Umstellung von Docker auf Podman im POC (Input von Marcello) hat gut funktioniert. 

**Drop**
Das Inhaltsverzeichnis in den github Readme files würden wir nicht mehr so umsetzten. Es ist bei Anpassung umständliche und aufwendig.

**Try**
Schneller auf Erfahrungen von anderen zurück greifen (Dozenten / Arbeitskollegen).
Lösung suchen, welche das Inhaltsverzeichnis von den Github Readme files automatisch aufbereitet.

- 2. Sprint / 14.06.2023
![2.Sprint](images/sprint-2.png)**

**Keep**
Die Zusammenarbeit in den Teilprojekten (IaC / Monitoring) hat gut funktioniert. 
Schnittstellen wurden zusammen besprochen und in Tasks aufgeteilt.
Visualisierungen des Netzwerk, Sicherheitsgruppen und Monitoring Overview war sehr hilfreich für das allgemeine Verständnis.
Das verwenden von Jinja-Templates beim erzeugen der Monitoring Instanze für das Auslesen der IP Adresses. 

**Drop***
Am Ursprungstask festhalten und zusätzliche Features gut hinterfragen, welche nicht im Task enthalten sind. Diese können schnell zu einem grossen Mehraufwand führen.

**Try**
Die Tasks besser priorisieren und allenfalls ins Backlog verschieben.


- 3. Sprint / 05.07.2023



- 4. Sprint / 12.07.2023


## 02 Communication Collaboration

![MSTeams](images/msteams_logo.png)

In order to ensure total transparency for the auditors, the project communication will be carried out via a dedicated teams channel "ITCNE23-SEM-I communication".

Allows the sharing of updates and discussion of project related issues in a centralised and organised manner for effective communication between us.

![Collaboration](images/collaboration.png)**Collaboration**
Use a Git repository to make project collaboration as agile and lean as possible and define clear system boundaries.


## 03 Testing

![Testing](images/testing.png)


| Description | Test Step | Expected Result | Status | Screen |
| ---     | ---   | ---     | ---   |  ---   |
| `Region`| Deploy IaC in eu-central-2 | Stack complete| Stack complete | [Screenshot](images/regionz.png) |
| `Region`| Deploy IaC in eu-central-1 | Stack complete| Stack complete | [Screenshot](images/regionf.png) |
| `Region`| Deploy monitoring in eu-central-1 | Stack complete| Stack complete | [Screenshot](images/regionfm.png) |
| `Region`| Deploy monitoring in eu-central-2 | Stack complete| Stack complete | [Screenshot](images/regionzm.png) |
| `Podman`| Check the Podman Containers are running | 4 Containers UP | 4 Containers UP | [Screenshot](images/check-podman-containers.png) |
| `Prometheus`| Check that the Prometheus is reachable and the targets are up | UI is reachable | UI is reachable | [Screenshot](images/check-prometheus-UI-targets.png) |
| `Grafan`| Check that the Grafana UI is reachable | UI reachable | UI reachable | [Screenshot](images) |
| `Blackbox-Exporter`| Check that the Blackbox-Exporter UI is reachable and Probes are available | UI reachable | UI reachable | [Screenshot](images/check-blackbox_exporter-UI.png) |
| `Alertmanager`| Check that the Alertmanager UI is reachable | UI reachable | UI reachable | [Screenshot](images/check-alertmanager-UI.png) |
| `Alertmanager`| Add gmailaddress / password to the config | Send email alerts | Send email alerts | [Screenshot](images/send-smtp-alerts.png) |
| `Prometheus`| Add new targets to the prometheus config | after container restart up | after container restart up | [Screenshot](images/add-targets-prometheus.png) |
| `Podman`| Reload the new config via podman-compose | 4 Containers UP  | 4 Containers UP | [Screenshot](images/restart-container-podman-compose.png) |
| `EC2 Instance`| Generate CPU load to test the Grafana Dashboard and the Alertmanager | Trigger Alert  | Trigger Alert  | [Screenshot-1](images/generate-cpu-load.png) <br> [Screenshot-2](images/grafan-cpu-load.png) <br> [Screenshot-3](images/firing-cpu-alert.png) <br> [Screenshot-4](images/resolved-cpu-alert.png) |
| `EC2 Instance`| Stop apache service to check Blackbox-Exporter and the Alertmanager | Trigger Alert  | Trigger Alert  | [Screenshot-1](images/stop-apache-service.png) <br> [Screenshot-2](images/not-reachable-url.png) <br> [Screenshot-3](images/firing-url-alert.png) <br> [Screenshot-4](images/resolved-url-alert.png) |
