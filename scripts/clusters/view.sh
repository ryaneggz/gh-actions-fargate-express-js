#!/bin/bash

# Prompt the user for the region
echo "Please enter the AWS region:"
read REGION

# Print the entered region (optional)
echo "You entered: $REGION"

aws ecs list-clusters --region $REGION