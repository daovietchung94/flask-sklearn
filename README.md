# Overview

In this project you will use Github Actions and Azure Pipelines to configure CI/CD. From there, the system will automatically lint, test and deploy the code to Azure App Service.

Becasuse the machine learning application only runs on Python 3.7 and below, Azure Cloud Shell has Python 3.9 installed so you can not test this application. Therefore, I will demo the installation, lint and test code with <a href="https://github.com/daovietchung94/azure-devops" title="Hello application">hello application</a>. After that you will continue to configure CD using Azure Pipelines with the machine application.

[![CI](https://github.com/daovietchung94/flask-sklearn/actions/workflows/python-app.yml/badge.svg?branch=master)](https://github.com/daovietchung94/flask-sklearn/actions/workflows/python-app.yml)

[![Build Status](https://dev.azure.com/daovietchung0266/Flask-ML-deploy/_apis/build/status/daovietchung94.flask-sklearn?branchName=master)](https://dev.azure.com/daovietchung0266/Flask-ML-deploy/_build/latest?definitionId=4&branchName=master)


# Project Plan

* Trello board: https://trello.com/b/5tR95Mz3/udacity-demo
* Project plan: https://docs.google.com/spreadsheets/d/14DtuwghqWaOR4hiwAYva4la1W68DIEWgzelkIorStW8/edit?usp=sharing

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
python3 -m venv ~/.myrepo
source ~/.myrepo/bin/activate
```
![Python virtual environment](/images/virtual-env.png)

### Install, lint and test code
Execute the command below to install dependencies, lint and test code
```bash
make all
```
![Make all](/images/make-all.png)

### Configure CI with GitHub Actions
You can use the <a href="https://github.com/daovietchung94/azure-devops/blob/master/.github/workflows/main.yml">config file</a> already in the <a href="https://github.com/daovietchung94/azure-devops">repository</a> or you can create on yourself.

![GitHub Actions](/images/github-actions.png)

Go to GitHub Actions and you can see all the workflows.

![GitHub workflows](/images/github-workflows.png)

If everything works perfectly then there will be blue icon, and vice versa there will be red icon and you can click on it to see exactly which step the error is coming from.

![GitHub error workflow](/images/github-error-workflow.png)

You can make a few changes to see the github action running.

### Configure CD with Azure Pipelines

Clone the project into Azure Cloud Shell

![Flask SKLearn](/images/clone-project-sklearn.png)

Create and deploy the code to Azure App Service with this command:
```bash
 az webapp up -n <web app name> --location eastus --resource-group <your resource group name> --sku F1 --os-type "Linux" --runtime "PYTHON:3.7"
```

![Azure App Service](/images/azure-app-service.png)

![Azure App Service](/images/azure-app-service-2.png)

Project running on Azure App Service : `http://<web app name>.azurewebsites.net`

You can test with Postman with request body:
```json
{
    "CHAS": {
        "0": 0
    },
    "RM": {
        "0": 6.575
    },
    "TAX": {
        "0": 296.0
    },
    "PTRATIO": {
        "0": 15.3
    },
    "B": {
        "0": 396.9
    },
    "LSTAT": {
        "0": 4.98
    }
}
```

![Postman](/images/post-man.png)

Configure CI with Github Actions similar to the instructions above

![GitHub Actions](/images/github-actions-flask-sklearn.png)

![GitHub Workflows](/images/github-workflows-sklearn.png)

Login to Azure DevOps, create project and service connection.

Project settings -> Pipelines -> Service connections -> New service connection -> Select Azure Resource Manager

For more details, you can follow the instructions at the link: 
https://learn.microsoft.com/en-us/azure/devops/pipelines/ecosystems/python-webapp?view=azure-devops

![Service Connection](/images/service-connection.png)

Next you need create a pipeline.

Pipelines -> New pipeline -> Github -> Select your repository -> Select Existing Azure Pipeline YAML file

![Azure Pipeline](/images/azure-pipeline.png)

Choose your master branch and your YAML file then click Continue.

![Azure Pipeline Detail](/images/azure-pipeline-detail.png)

Replace <code>azureServiceConnectionId</code> and <code>webAppName</code> with your values then click <code>Run</code>

Azure Pipeline will start running following the steps that you can see as shown below. Once all the steps are done, the code has been deployed to Azure App Service.

![Azure Pipeline Result](/images/azure-pipeline-result-1.png)

![Azure Pipeline Result](/images/azure-pipeline-result-2.png)

You can check by following the link and check again with Postman as instructed above or you can update the file <code>make_predict_azure_app.sh</code> with your webapp url and run this file on Azure Cloud Shell

![Make predict](/images/make-predict.png)

You can inspect the logs from running application with the command:
```bash
az webapp log tail
```

![Application Logs](/images/logs-1.png)

Make a change to your app.py, so you can see your CI/CD pipeline on GitHub Actions and Azure DevOps.

I update home page title from <code>Sklearn Prediction Home</code> to <code>Sklearn Prediction Home - Updated</code> and commit to GitHub

![Github Actions](/images/ci-home-page.png)

![Azure Pipeline](/images/azure-home-page.png)

![SKLearn](/images/sklearn-updated.png)

## Enhancements

* Create a friendly UI
* Run the app on AKS

## Demo 

https://www.youtube.com/watch?v=ekmOYnMDJPg


