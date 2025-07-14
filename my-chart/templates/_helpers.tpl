{{/*
Expand the name of the chart.
*/}}
{{- define "my-chart.name" -}}
{{- default.Chart.Name.Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "my-chart.fullname" -}}
{{- if.Values.fullnameOverride }}
{{-.Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default.Chart.Name.Values.nameOverride }}
{{- if contains $name.Release.Name }}
{{-.Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s".Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart-level default labels.
*/}}
{{- define "my-chart.labels" -}}
helm.sh/chart: {{ include "my-chart.name". }}
{{ include "my-chart.selectorLabels". }}
{{- if.Chart.AppVersion }}
app.kubernetes.io/version: {{.Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{.Release.Service }}
{{- end }}

{{/*
Selector labels that will be used to identify all resources belonging to this release.
*/}}
{{- define "my-chart.selectorLabels" -}}
app.kubernetes.io/name: {{ include "my-chart.name". }}
app.kubernetes.io/instance: {{.Release.Name }}
{{- end }}