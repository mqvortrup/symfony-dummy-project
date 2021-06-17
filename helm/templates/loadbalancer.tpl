{{- define "loadbalancer.template" -}}
apiVersion: v1
kind: Service
metadata:
  name: {{ .service.name | quote }}
spec:
  type: LoadBalancer
  ports:
  - port: {{ .service.port }}
  selector:
    app: {{ .service.name | quote }}
{{- end -}}
