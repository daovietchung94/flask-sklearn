# Overview

In this project you will use Github Actions and Azure Pipelines to configure CI/CD. From there, the system will automatically lint, test and deploy the code to Azure App Service.

# Project Plan

* Trello board: 
* Project plan:

# Instructions

## Architectural Diagram
* Azure Cloud Shell\
![Azure Cloud Shell](/images/azure-cloud-shell.png)
* CI Diagram\
![CI Diagram](/images/ci-diagram.png)
* CD Diagram\
![CD Diagram](/images/cd-diagram.png)

## Setup Azure Cloud Shell
### SSH key
Open the Azure Cloud Shell and use the commands below to create SSH key and get its public key:
```bash
    ssh-keygen -t rsa
    cat ~/.ssh/id_rsa.pub
```
![SSH key](/images/ssh-key.png)

Copy public key and paste into GitHub

![SSH GitHub](/images/add-ssh-to-github.png)

Clone project into Azure Cloud Shell

![Clone project](/images/clone-project.png)

### Create the Python Virtual Environment
Remember that by creating a virtual environment in the home directory, it will not be accidentally checked out in your project.
```bash
python3 -m venv ~/.azure-devops
source ~/.azure-devops/bin/activate
```
![Python virtual environment](/images/virtual-env.png)

### Install, lint and test code
Execute the command below to install dependencies, lint and test code
```bash
make all
```
![Make all](/images/make-all.png)



* Project running on Azure App Service

* Project cloned into Azure Cloud Shell

* Passing tests that are displayed after running the `make all` command from the `Makefile`

* Output of a test run

* Successful deploy of the project in Azure Pipelines.  [Note the official documentation should be referred to and double checked as you setup CI/CD](https://docs.microsoft.com/en-us/azure/devops/pipelines/ecosystems/python-webapp?view=azure-devops).

* Running Azure App Service from Azure Pipelines automatic deployment

* Successful prediction from deployed flask app in Azure Cloud Shell.  [Use this file as a template for the deployed prediction](https://github.com/udacity/nd082-Azure-Cloud-DevOps-Starter-Code/blob/master/C2-AgileDevelopmentwithAzure/project/starter_files/flask-sklearn/make_predict_azure_app.sh).
The output should look similar to this:

```bash
udacity@Azure:~$ ./make_predict_azure_app.sh
Port: 443
{"prediction":[20.35373177134412]}
```

* Output of streamed log files from deployed application

> 

## Enhancements

<TODO: A short description of how to improve the project in the future>

## Demo 

<TODO: Add link Screencast on YouTube>


