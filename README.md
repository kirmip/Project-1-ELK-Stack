## Project-1-ELK-Stack

The files in this repository were used to configure the network depicted below.
![image](https://user-images.githubusercontent.com/25280167/181864999-14c16704-7f4f-40c6-bc77-72495ed63efb.png)

[Diagrams/Week 13 Project Network Diagram.png](https://github.com/kirmip/Project-1-ELK-Stack/blob/b18afb020deac3c46292a1e81da3f6efc78bf82e/Diagrams/Week%2013%20Project%20Network%20Diagram.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the yml and config file may be used to install only certain pieces of it, such as Filebeat.

  - [Pentest.yml](https://github.com/kirmip/Project-1-ELK-Stack/blob/2fcc9ffca244bfa09851f89308265bedf49eaac1/Ansible/pentest.yml)
  - [Ansible.config](https://github.com/kirmip/Project-1-ELK-Stack/blob/2fcc9ffca244bfa09851f89308265bedf49eaac1/Ansible/ansible.cfg)
  - [Filebeat-configuration.yml](https://github.com/kirmip/Project-1-ELK-Stack/blob/2fcc9ffca244bfa09851f89308265bedf49eaac1/Ansible/filebeat-configuration.yml)
  - [Filebeat-playbook.yml](https://github.com/kirmip/Project-1-ELK-Stack/blob/2fcc9ffca244bfa09851f89308265bedf49eaac1/Ansible/filebeat-playbook.yml)
  - [Hosts](https://github.com/kirmip/Project-1-ELK-Stack/blob/2fcc9ffca244bfa09851f89308265bedf49eaac1/Ansible/hosts)
  - [Install-elk.yml](https://github.com/kirmip/Project-1-ELK-Stack/blob/2fcc9ffca244bfa09851f89308265bedf49eaac1/Ansible/install-elk.yml)
  - [Metricbeat-configuration.yml](https://github.com/kirmip/Project-1-ELK-Stack/blob/2fcc9ffca244bfa09851f89308265bedf49eaac1/Ansible/metricbeat-configuration.yml)
  - [Metricbeat-playbook.yml](https://github.com/kirmip/Project-1-ELK-Stack/blob/2fcc9ffca244bfa09851f89308265bedf49eaac1/Ansible/metricbeat-playbook.yml)

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly applicable and functional, in addition to restricting traffic to the network.
- What aspect of security do load balancers protect? What is the advantage of a jump box?
  - Load balancers also add flexibility to distribute live traffic and protects the availability of a server if cases of a DDoS attack or any technical issues with the server. The advantage of a jump box is that it prevents other VMs from being exposed via a public ip address. 

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the network and system logs.
- What does Filebeat watch for?
  - Filebeat watch for system logs such as logon attempts and more
- What does Metricbeat record?
  - Metricbeat records metric data such as cpu usuage and statistics

The configuration details of each machine may be found below.

|    Name   |  Function  | IP Address | Operating System |
|-----------|------------|------------|------------------|
| Jump Box  | Gateway    | 10.0.0.4   | Linux            |
| Web-1     | Server     | 10.0.0.5   | Linux            |
| Web-2     | Server     | 10.0.0.6   | Linux            |
| ELKServer | ELK Server | 10.1.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump-box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- 20.93.87.194 (Jump-box pubic IP address)

Machines within the network can only be accessed by Jump-box gateway machine through SSH.
- Which machine did you allow to access your ELK VM? What was its IP address?
  - Jump-box, IP: 10.0.0.4 using SSH port 22 

A summary of the access policies in place can be found in the table below.

| Name      | Publicly Accessible | Allowed IP Addresses |
|-----------|---------------------|----------------------|
| Jump Box  | Yes                 | 20.93.87.194         |
| Web-1     | No                  | 10.0.0.5             |
| Web-2     | No                  | 10.0.0.6             |
| ELKServer | Yes                 | 52.255.41.62         |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because it ensures that it is configurations are consitent throughout all the machines/systems. This way there won't be a need to manually check individual configurations to make sure that they are the same on all systems. 

The playbook implements the following tasks:
- Install docker
- Install python3
- Install pip module
- Increase virtual memory
- Download and launch elk docker container with image: sebp/elk:761 along with enabling the following published ports: 5601:5601, 9200:9200, 5044:5044.
- Enable the docker service

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![image](https://user-images.githubusercontent.com/25280167/183648386-3b5d46bd-8016-4136-addd-cd7a39c1a404.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web-1: 10.0.0.5
- Web-2: 10.0.0.6

We have installed the following Beats on these machines:
- Filebeat and Metricbeat were installed on these machines

These Beats allow us to collect the following information from each machine:
- Filebeat allows us to collect log files from the target machine such as system logs such as login attempts, event logs which then forwards the data to the ELK server.
- Metricbeat allows us to collect machine statistical data such as CPU usuage, memory usuage, network traffic and forwards the data to ELK server.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the yml file to ansible folder.
- Update the config file to include remote users and ports
- Run the playbook, and navigate to Kibana (https://52.255.41.62:5601/app/kibana) to check that the installation worked as expected.
