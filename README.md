# GitHub Actions Runner with AWS Fargate

1. Check for any existing clusters in a given region
```bash
## Will be prompted for REGION
bash scripts/clusters/view.sh
```

2. Create an ECS Cluster in Region
```bash
## Will be prompted for REGION and CLUSTER_NAME
bash scripts/clusters/create.sh
```

3. Create a Task Defintion
```bash
## Will be prompted for REGION
bash scripts/tasks/definition.sh
```

3. Create a Task on cluster
```bash
## Will be prompted for REGION, CLUSTER_NAME, and TASK_DEF_NAME
bash scripts/tasks/create.sh
```