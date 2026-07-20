{{- define "example-chart.name" -}}
{{- default .Chart.Name .Values.nameOverride }}
{{- end -}}

{{- define "example-chart.fullname" -}}
{{- printf "%s-%s" (include "example-chart.name" .) .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end -}}
