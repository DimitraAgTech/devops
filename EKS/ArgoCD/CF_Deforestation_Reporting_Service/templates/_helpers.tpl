{{/* Define the base name of the chart */}}
{{- define "CF_Deforestation_Reporting_Service.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Create a fully qualified app name that is simply the chart name */}}
{{- define "CF_Deforestation_Reporting_Service.fullname" -}}
{{- default .Chart.Name .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Create chart name and version as used by the chart label */}}
{{- define "CF_Deforestation_Reporting_Service.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Define common labels */}}
{{- define "CF_Deforestation_Reporting_Service.labels" -}}
helm.sh/chart: {{ include "CF_Deforestation_Reporting_Service.chart" . }}
app.kubernetes.io/name: {{ include "CF_Deforestation_Reporting_Service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/* Selector labels are based on app name and instance */}}
{{- define "CF_Deforestation_Reporting_Service.selectorLabels" -}}
app.kubernetes.io/name: {{ include "CF_Deforestation_Reporting_Service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/* Determine the service account name based on whether one should be created */}}
{{- define "CF_Deforestation_Reporting_Service.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "CF_Deforestation_Reporting_Service.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}