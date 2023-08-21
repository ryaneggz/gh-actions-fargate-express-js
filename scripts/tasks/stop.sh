#!/bin/bash

# Prompt the user for the region
echo "Please enter the AWS region:"
read REGION

# Prompt the user for the ECS Cluster Name
echo "Please enter the ECS Cluster Name:"
read CLUSTER_NAME

# Prompt the user for the Task Definition name
# (assuming you want to stop all tasks of this definition)
echo "Please enter the Task Definition name:"
read TASK_DEF_NAME

# List running tasks for the specific Task Definition and Cluster
TASKS=$(aws ecs list-tasks --region $REGION --cluster $CLUSTER_NAME --family $TASK_DEF_NAME --query 'taskArns' --output text)

if [ -z "$TASKS" ]; then
    echo "No tasks found to stop for the Task Definition: $TASK_DEF_NAME in the Cluster: $CLUSTER_NAME"
    exit 1
fi

# Stop each task found for the provided Task Definition and Cluster
for TASK_ARN in $TASKS; do
    echo "Stopping task: $TASK_ARN"
    aws ecs stop-task --region $REGION --cluster $CLUSTER_NAME --task $TASK_ARN
done

echo "All tasks have been stopped for the Task Definition: $TASK_DEF_NAME in the Cluster: $CLUSTER_NAME"
