{{- define "my-chart.name" -}}
{{ .Chart.Name }}
{{- end }}

{{- define "my-chart.fullname" -}}
{{ include "my-chart.name" . }}-{{ .Release.Name }}
{{- end }}

{{- define "my-chart.labels" -}}
app.kubernetes.io/name: {{ include "my-chart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "my-chart.selectorLabels" -}}
app.kubernetes.io/name: {{ include "my-chart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
