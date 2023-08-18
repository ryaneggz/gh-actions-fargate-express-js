#!/bin/bash

# Prompt the user for the region
echo "Please enter the AWS region:"
read REGION

# Print the entered region (optional)
echo "You entered: $REGION"

# Prompt the user for the region
aws ecs register-task-definition \
--region $REGION \
--cli-input-json file://runner/task-def.json
