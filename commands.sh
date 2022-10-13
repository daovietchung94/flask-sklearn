#!/usr/bin/env bash

# Deploy code to Azure App Service
az webapp up -n flask-sklearn-chungdv --location eastus --resource-group chungdv-rg --sku F1 --os-type "Linux" --runtime "PYTHON:3.7"

# Test predict endpoint 
./make_predict_azure_app.sh

# View application logs
az webapp log tail
