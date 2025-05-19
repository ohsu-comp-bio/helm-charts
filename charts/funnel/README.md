# funnel
Currently we are developing with the same format as the example_dev_values.yaml file

![Version: 0.1.34](https://img.shields.io/badge/Version-0.1.34-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.11.2](https://img.shields.io/badge/AppVersion-0.11.2-informational?style=flat-square)

A toolkit for distributed task execution ⚙️

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | mongodb | 13.9.4 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| AWSBatch.DisableReconciler | bool | `true` |  |
| AWSBatch.JobDefinition | string | `"funnel-job-def"` |  |
| AWSBatch.JobQueue | string | `"funnel-job-queue"` |  |
| AWSBatch.Key | string | `""` |  |
| AWSBatch.ReconcileRate | string | `"10m"` |  |
| AWSBatch.Region | string | `""` |  |
| AWSBatch.Secret | string | `""` |  |
| AmazonS3.Disabled | bool | `false` |  |
| AmazonS3.Key | string | `""` |  |
| AmazonS3.MaxRetries | int | `10` |  |
| AmazonS3.SSE.CustomerKeyFile | string | `""` |  |
| AmazonS3.SSE.KMSKey | string | `""` |  |
| AmazonS3.Secret | string | `""` |  |
| BoltDB.Path | string | `"./funnel-work-dir/funnel.db"` |  |
| Compute | string | `"kubernetes"` |  |
| Database | string | `"mongodb"` |  |
| Datastore.CredentialsFile | string | `""` |  |
| Datastore.Project | string | `""` |  |
| DynamoDB.Key | string | `""` |  |
| DynamoDB.Region | string | `""` |  |
| DynamoDB.Secret | string | `""` |  |
| DynamoDB.TableBasename | string | `"funnel"` |  |
| Elastic.IndexPrefix | string | `"funnel"` |  |
| Elastic.URL | string | `"http://localhost:9200"` |  |
| EventWriters[0] | string | `"mongodb"` |  |
| EventWriters[1] | string | `"log"` |  |
| FTPStorage.Disabled | bool | `false` |  |
| FTPStorage.Password | string | `"anonymous"` |  |
| FTPStorage.Timeout | string | `"10s"` |  |
| FTPStorage.User | string | `"anonymous"` |  |
| GoogleStorage.CredentialsFile | string | `""` |  |
| GoogleStorage.Disabled | bool | `false` |  |
| GridEngine.Template | string | `"#!bin/bash\n#$ -N {{.TaskId}}\n#$ -o {{.WorkDir}}/funnel-stdout\n#$ -e {{.WorkDir}}/funnel-stderr\n#$ -l nodes=1\n{{if ne .Cpus 0 -}}\n{{printf \"#$ -pe mpi %d\" .Cpus}}\n{{- end}}\n{{if ne .RamGb 0.0 -}}\n{{printf \"#$ -l h_vmem=%.0fG\" .RamGb}}\n{{- end}}\n{{if ne .DiskGb 0.0 -}}\n{{printf \"#$ -l h_fsize=%.0fG\" .DiskGb}}\n{{- end}}\n\n{{.Executable}} worker run --config {{.Config}} --taskID {{.TaskId}}\n"` |  |
| GridEngine.TemplateFile | string | `""` |  |
| HTCondor.DisableReconciler | bool | `true` |  |
| HTCondor.ReconcileRate | string | `"10m"` |  |
| HTCondor.Template | string | `"universe = vanilla\ngetenv = True\nexecutable = {{.Executable}}\narguments = worker run --config {{.Config}} --task-id {{.TaskId}}\nlog = {{.WorkDir}}/condor-event-log\nerror = {{.WorkDir}}/funnel-stderr\noutput = {{.WorkDir}}/funnel-stdout\nshould_transfer_files = YES\nwhen_to_transfer_output = ON_EXIT_OR_EVICT\n{{if ne .Cpus 0 -}}\n{{printf \"request_cpus = %d\" .Cpus}}\n{{- end}}\n{{if ne .RamGb 0.0 -}}\n{{printf \"request_memory = %.0f GB\" .RamGb}}\n{{- end}}\n{{if ne .DiskGb 0.0 -}}\n{{printf \"request_disk = %.0f GB\" .DiskGb}}\n{{- end}}\n\nqueue\n"` |  |
| HTCondor.TemplateFile | string | `""` |  |
| HTTPStorage.Timeout | string | `"30s"` |  |
| Kafka.Servers[0] | string | `""` |  |
| Kafka.Topic | string | `"funnel"` |  |
| Kubernetes.Bucket | string | `""` |  |
| Kubernetes.DisableReconciler | bool | `true` |  |
| Kubernetes.Executor | string | `"kubernetes"` |  |
| Kubernetes.ExecutorTemplate | string | `""` |  |
| Kubernetes.ExecutorTemplateFile | string | `""` |  |
| Kubernetes.JobsNamespace | string | `""` |  |
| Kubernetes.Namespace | string | `""` |  |
| Kubernetes.ReconcileRate | string | `"10m"` |  |
| Kubernetes.Region | string | `""` |  |
| Kubernetes.ServiceAccount | string | `""` |  |
| Kubernetes.Template | string | `""` |  |
| Kubernetes.TemplateFile | string | `""` |  |
| LocalStorage.AllowedDirs[0] | string | `"./"` |  |
| Logger.Level | string | `"info"` |  |
| Logger.OutputFile | string | `""` |  |
| MongoDB.Addrs | list | `[]` |  |
| MongoDB.Database | string | `"funnel"` |  |
| MongoDB.Password | string | `"example"` |  |
| MongoDB.Timeout | string | `"5m"` |  |
| MongoDB.Username | string | `"example"` |  |
| Node.ID | string | `""` |  |
| Node.Resources.Cpus | int | `0` |  |
| Node.Resources.DiskGb | float | `0` |  |
| Node.Resources.RamGb | float | `0` |  |
| Node.Timeout | string | `"-1s"` |  |
| Node.UpdateRate | string | `"5s"` |  |
| PBS.DisableReconciler | bool | `true` |  |
| PBS.ReconcileRate | string | `"10m"` |  |
| PBS.Template | string | `"#!bin/bash\n#PBS -N {{.TaskId}}\n#PBS -o {{.WorkDir}}/funnel-stdout\n#PBS -e {{.WorkDir}}/funnel-stderr\n{{if ne .Cpus 0 -}}\n{{printf \"#PBS -l nodes=1:ppn=%d\" .Cpus}}\n{{- end}}\n{{if ne .RamGb 0.0 -}}\n{{printf \"#PBS -l mem=%.0fgb\" .RamGb}}\n{{- end}}\n{{if ne .DiskGb 0.0 -}}\n{{printf \"#PBS -l file=%.0fgb\" .DiskGb}}\n{{- end}}\n\n{{.Executable}} worker run --config {{.Config}} --taskID {{.TaskId}}\n"` |  |
| PBS.TemplateFile | string | `""` |  |
| Plugins.Dir | string | `"plugin-binaries"` |  |
| Plugins.Disabled | bool | `true` |  |
| Plugins.Host | string | `"http://funnel-plugin-test-server:8080/token?user="` |  |
| Plugins.Input | string | `"user"` |  |
| Plugins.Plugin | string | `"auth-plugin"` |  |
| RPCClient.MaxRetries | int | `10` |  |
| RPCClient.ServerAddress | string | `"localhost:9090"` |  |
| RPCClient.Timeout | string | `"60s"` |  |
| Scheduler.NodeInitTimeout | string | `"5m"` |  |
| Scheduler.NodePingTimeout | string | `"1m"` |  |
| Scheduler.ScheduleChunk | int | `10` |  |
| Scheduler.ScheduleRate | string | `"1s"` |  |
| Server.DisableHTTPCache | bool | `true` |  |
| Server.HTTPPort | int | `8000` |  |
| Server.HostName | string | `"funnel"` |  |
| Server.RPCPort | int | `9090` |  |
| Slurm.DisableReconciler | bool | `true` |  |
| Slurm.ReconcileRate | string | `"10m"` |  |
| Slurm.Template | string | `"#!/bin/bash\n#SBATCH --job-name {{.TaskId}}\n#SBATCH --ntasks 1\n#SBATCH --error {{.WorkDir}}/funnel-stderr\n#SBATCH --output {{.WorkDir}}/funnel-stdout\n{{if ne .Cpus 0 -}}\n{{printf \"#SBATCH --cpus-per-task %d\" .Cpus}}\n{{- end}}\n{{if ne .RamGb 0.0 -}}\n{{printf \"#SBATCH --mem %.0fGB\" .RamGb}}\n{{- end}}\n{{if ne .DiskGb 0.0 -}}\n{{printf \"#SBATCH --tmp %.0fGB\" .DiskGb}}\n{{- end}}\n\n{{.Executable}} worker run --config {{.Config}} --taskID {{.TaskId}}\n"` |  |
| Slurm.TemplateFile | string | `""` |  |
| Swift.AuthURL | string | `""` |  |
| Swift.ChunkSizeBytes | int | `500000000` |  |
| Swift.Disabled | bool | `false` |  |
| Swift.Password | string | `""` |  |
| Swift.RegionName | string | `""` |  |
| Swift.TenantID | string | `""` |  |
| Swift.TenantName | string | `""` |  |
| Swift.UserName | string | `""` |  |
| Worker.LeaveWorkDir | bool | `false` |  |
| Worker.LogTailSize | int | `10000` |  |
| Worker.LogUpdateRate | string | `"5s"` |  |
| Worker.MaxParallelTransfers | int | `10` |  |
| Worker.PollingRate | string | `"5s"` |  |
| Worker.WorkDir | string | `"./funnel-work-dir"` |  |
| image.initContainer.command[0] | string | `"cp"` |  |
| image.initContainer.command[1] | string | `"/app/build/plugins/authorizer"` |  |
| image.initContainer.command[2] | string | `"/opt/funnel/plugin-binaries/auth-plugin"` |  |
| image.initContainer.image | string | `"quay.io/ohsu-comp-bio/funnel-plugins"` |  |
| image.initContainer.pullPolicy | string | `"Always"` |  |
| image.initContainer.tag | string | `"latest"` |  |
| image.pullPolicy | string | `"Always"` |  |
| image.repository | string | `"quay.io/ohsu-comp-bio/funnel"` |  |
| image.tag | string | `"testing"` |  |
| labels.app | string | `"funnel"` |  |
| mongodb.architecture | string | `"standalone"` |  |
| mongodb.auth.enabled | bool | `true` |  |
| mongodb.auth.rootPassword | string | `"example"` |  |
| mongodb.auth.rootUser | string | `"example"` |  |
| mongodb.image.registry | string | `"public.ecr.aws"` |  |
| mongodb.persistence.enabled | bool | `false` |  |
| mongodb.persistence.size | string | `"1Gi"` |  |
| rbac.create | bool | `true` |  |
| replicaCount | int | `1` |  |
| resources.limits.cpu | string | `"1000m"` |  |
| resources.limits.memory | string | `"1Gi"` |  |
| resources.requests.cpu | string | `"100m"` |  |
| resources.requests.memory | string | `"100Mi"` |  |
| service.httpPort | int | `8000` |  |
| service.rpcPort | int | `9090` |  |
| service.type | string | `"ClusterIP"` |  |
| storage.accessMode | string | `"ReadWriteMany"` |  |
| storage.className | string | `"s3-csi-sc"` |  |
| storage.createStorageClass | bool | `true` |  |
| storage.driver | string | `"aws-s3"` |  |
| storage.provisioner | string | `"s3.csi.aws.com"` |  |
| storage.size | string | `"10Mi"` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
