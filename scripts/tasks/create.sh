#!/bin/bash

echo ">>> *STILL UNDER DEVELOPMENT STUCK IN PENDING, use the GUI"

# Prompt the user for the region
echo "Please enter the AWS region:"
read REGION

# Prompt the user for the ECS Cluster Name
echo "Please enter the ECS Cluster Name:"
read CLUSTER_NAME

# Prompt the user for the Task Definition name
echo "Please enter the Task Definition name:"
read TASK_DEF_NAME

# Fetch the first available subnet in the region
SUBNETS=$(aws ec2 describe-subnets --region $REGION --query 'Subnets[0].SubnetId' --output text)

# Optionally, fetch the first available security group in the region
SEC_GROUPS=$(aws ec2 describe-security-groups --region $REGION --query 'SecurityGroups[0].GroupId' --output text)

echo "Using Subnet: $SUBNETS"
echo "Using Security Group: $SEC_GROUPS"

aws ecs run-task \
--region $REGION \
--cluster $CLUSTER_NAME \
--task-definition $TASK_DEF_NAME \
--launch-type FARGATE \
--network-configuration "awsvpcConfiguration={subnets=[$SUBNETS],securityGroups=[$SEC_GROUPS],assignPublicIp=ENABLED}"
