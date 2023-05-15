Definition Lean / Agile Project
==== 

Roger stellt die User data für Grafana und DB Server berreit. 

Implemenatin User Data to ec2 über github -> Dany 

## Table of Content

* 01 - [Our Kanban Board Explained](#01-Our-Kanban-Board-Explained)
* 02 - [Communication](#02-Communication)
* 03 - [SMART Objectives](#03-SMART-Objectives)
* 04 - [Seusag](#04-Seusag)
* 05 - [Merge ](#05-Merge)
* 06 - [Dependencies](#06-Dependencies)


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


## 02 Communication 

![MSTeams](images/msteams_logo.png)

In order to ensure total transparency for the auditors, the project communication will be carried out via a dedicated teams channel "ITCNE23-SEM-I communication".

Allows the sharing of updates and discussion of project related issues in a centralised and organised manner for effective communication between us.


## 03 SMART Objectives

### 03.1 Collaboration
Use a Git repository to make project collaboration as agile and lean as possible and define clear system boundaries.

###  IaC Infrastructure as Code

![yamliac](images/yaml_logo.png)

###  Monitoring

![grafana](images/grafana_logo.png)

## 04 Seusag
Was deployed Dany was kommt von Roger 
Roger liefert User Data information über github pull und sagt wie viel server er wo braucht mit welchen verbindungen 
Ich öffne die enstprechenden verbindungen und intigriere die server mit userdata in mein Iac Script 

### iac Seusag

### Monitoring Seusag 

### Zusammengefügtes seusag


## 05 Dependencies

### Monitoring
User Data wird von Github pull gemacht

### Target
Proetheus Tarets apt installieren 
Private IP Adresse Komunnizieren