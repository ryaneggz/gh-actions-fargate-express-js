#!/bin/bash

# Prompt the user for the region
echo "Please enter the AWS region:"
read REGION

# Prompt the user for the region
echo "Please enter the ECS Cluster Name:"
read CLUSTER_NAME

# Create the ECS cluster (or any other AWS commands)
aws ecs create-cluster --cluster-name $CLUSTER_NAME --region $REGION