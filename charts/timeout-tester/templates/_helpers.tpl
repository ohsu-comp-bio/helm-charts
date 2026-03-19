{{/*
Expand the name of the chart.
*/}}
{{- define "timeout-tester.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "timeout-tester.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "timeout-tester.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "timeout-tester.labels" -}}
helm.sh/chart: {{ include "timeout-tester.chart" . }}
{{ include "timeout-tester.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "timeout-tester.selectorLabels" -}}
app.kubernetes.io/name: {{ include "timeout-tester.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "timeout-tester.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "timeout-tester.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/* Generate self-signed certificates */}}
{{- define "timeout-tester.certs" -}}
{{- $name := include "timeout-tester.fullname" . -}}
{{- $secretName := printf "%s-tls" $name -}}

{{/* 1. LOOKUP: Check if the cluster already has this secret */}}
{{- $secret := (lookup "v1" "Secret" .Release.Namespace $secretName) -}}

{{/* 2. STABLE: If it exists, use the CA and Cert already there */}}
{{- if $secret -}}
ca: {{ index $secret.data "ca.crt" }}
cert: {{ index $secret.data "tls.crt" }}
key: {{ index $secret.data "tls.key" }}
{{- else -}}

{{/* 3. NEW: If it's the very first time, generate it ONCE */}}
{{- $ca := genCA "timeout-tester-ca" 365 -}}
{{- $cert := genSignedCert (printf "%s.%s.svc" $name .Release.Namespace) nil (list (printf "%s.%s.svc" $name .Release.Namespace)) 365 $ca -}}
ca: {{ $ca.Cert | b64enc }}
cert: {{ $cert.Cert | b64enc }}
key: {{ $cert.Key | b64enc }}
{{- end -}}
{{- end -}}