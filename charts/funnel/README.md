# funnel

![Version: 0.1.48](https://img.shields.io/badge/Version-0.1.48-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2025-06-25](https://img.shields.io/badge/AppVersion-2025--06--25-informational?style=flat-square)

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
| AWSBatch.ReconcileRate | string | `"600s"` |  |
| AWSBatch.Region | string | `""` |  |
| AWSBatch.Secret | string | `""` |  |
| AmazonS3.AWSConfig.Key | string | `""` |  |
| AmazonS3.AWSConfig.MaxRetries | int | `10` |  |
| AmazonS3.AWSConfig.Secret | string | `""` |  |
| AmazonS3.Disabled | bool | `false` |  |
| AmazonS3.SSE.CustomerKeyFile | string | `""` |  |
| AmazonS3.SSE.KMSKey | string | `""` |  |
| BoltDB.Path | string | `"./funnel-work-dir/funnel.db"` |  |
| Compute | string | `"kubernetes"` |  |
| Database | string | `"mongodb"` |  |
| Datastore.CredentialsFile | string | `""` |  |
| Datastore.Project | string | `""` |  |
| DynamoDB.AWSConfig.Key | string | `""` |  |
| DynamoDB.AWSConfig.Region | string | `""` |  |
| DynamoDB.AWSConfig.Secret | string | `""` |  |
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
| HTCondor.ReconcileRate | string | `"600s"` |  |
| HTCondor.Template | string | `"universe = vanilla\ngetenv = True\nexecutable = {{.Executable}}\narguments = worker run --config {{.Config}} --task-id {{.TaskId}}\nlog = {{.WorkDir}}/condor-event-log\nerror = {{.WorkDir}}/funnel-stderr\noutput = {{.WorkDir}}/funnel-stdout\nshould_transfer_files = YES\nwhen_to_transfer_output = ON_EXIT_OR_EVICT\n{{if ne .Cpus 0 -}}\n{{printf \"request_cpus = %d\" .Cpus}}\n{{- end}}\n{{if ne .RamGb 0.0 -}}\n{{printf \"request_memory = %.0f GB\" .RamGb}}\n{{- end}}\n{{if ne .DiskGb 0.0 -}}\n{{printf \"request_disk = %.0f GB\" .DiskGb}}\n{{- end}}\n\nqueue\n"` |  |
| HTCondor.TemplateFile | string | `""` |  |
| HTTPStorage.Timeout | string | `"30s"` |  |
| Kafka.Topic | string | `"funnel"` |  |
| Kubernetes.DisableJobCleanup | bool | `false` |  |
| Kubernetes.DisableReconciler | bool | `false` |  |
| Kubernetes.Executor | string | `"kubernetes"` |  |
| Kubernetes.ExecutorTemplate | string | `""` |  |
| Kubernetes.JobsNamespace | string | `""` |  |
| Kubernetes.Namespace | string | `""` |  |
| Kubernetes.PVCTemplate | string | `""` |  |
| Kubernetes.PVTemplate | string | `""` |  |
| Kubernetes.ReconcileRate | string | `"600s"` |  |
| Kubernetes.ServiceAccount | string | `""` |  |
| Kubernetes.WorkerTemplate | string | `""` |  |
| LocalStorage.AllowedDirs[0] | string | `"./"` |  |
| Logger.level | string | `"debug"` |  |
| Logger.outputFile | string | `""` |  |
| MongoDB.Addrs | list | `[]` |  |
| MongoDB.Database | string | `"funnel"` |  |
| MongoDB.Password | string | `"example"` |  |
| MongoDB.Timeout.duration | string | `"300s"` |  |
| MongoDB.Username | string | `"example"` |  |
| Node.ID | string | `""` |  |
| Node.Resources.Cpus | int | `0` |  |
| Node.Resources.DiskGb | float | `0` |  |
| Node.Resources.RamGb | float | `0` |  |
| Node.Timeout.disabled | bool | `true` |  |
| Node.UpdateRate | string | `"5s"` |  |
| PBS.DisableReconciler | bool | `true` |  |
| PBS.ReconcileRate | string | `"600s"` |  |
| PBS.Template | string | `"#!bin/bash\n#PBS -N {{.TaskId}}\n#PBS -o {{.WorkDir}}/funnel-stdout\n#PBS -e {{.WorkDir}}/funnel-stderr\n{{if ne .Cpus 0 -}}\n{{printf \"#PBS -l nodes=1:ppn=%d\" .Cpus}}\n{{- end}}\n{{if ne .RamGb 0.0 -}}\n{{printf \"#PBS -l mem=%.0fgb\" .RamGb}}\n{{- end}}\n{{if ne .DiskGb 0.0 -}}\n{{printf \"#PBS -l file=%.0fgb\" .DiskGb}}\n{{- end}}\n\n{{.Executable}} worker run --config {{.Config}} --taskID {{.TaskId}}\n"` |  |
| PBS.TemplateFile | string | `""` |  |
| RPCClient.MaxRetries | int | `10` |  |
| RPCClient.ServerAddress | string | `"localhost:9090"` |  |
| RPCClient.Timeout.duration | string | `"60s"` |  |
| Scheduler.NodeInitTimeout.duration | string | `"300s"` |  |
| Scheduler.NodePingTimeout.duration | string | `"60s"` |  |
| Scheduler.ScheduleChunk | int | `10` |  |
| Scheduler.ScheduleRate | string | `"1s"` |  |
| Server.DisableHTTPCache | bool | `true` |  |
| Server.HTTPPort | string | `"8000"` |  |
| Server.HostName | string | `"funnel"` |  |
| Server.RPCPort | string | `"9090"` |  |
| Slurm.DisableReconciler | bool | `true` |  |
| Slurm.ReconcileRate | string | `"600s"` |  |
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
| image.initContainer.tag | string | `"pr-1"` |  |
| image.pullPolicy | string | `"Always"` |  |
| image.repository | string | `"quay.io/ohsu-comp-bio/funnel"` |  |
| labels.app | string | `"funnel"` |  |
| mongodb.architecture | string | `"standalone"` |  |
| mongodb.auth.enabled | bool | `true` |  |
| mongodb.auth.rootPassword | string | `"example"` |  |
| mongodb.auth.rootUser | string | `"example"` |  |
| mongodb.commonLabels.app | string | `"funnel"` |  |
| mongodb.image.registry | string | `"public.ecr.aws"` |  |
| mongodb.persistence.enabled | bool | `false` |  |
| mongodb.persistence.size | string | `"1Gi"` |  |
| rbac.create | bool | `true` |  |
| replicaCount | int | `1` |  |
| resources.limits.cpu | int | `0` |  |
| resources.limits.memory | int | `0` |  |
| resources.requests.cpu | int | `0` |  |
| resources.requests.memory | int | `0` |  |
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
