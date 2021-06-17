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
    
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: {{ .service.name | quote }}
spec:
  rules:
    - host: {{ .service.host | quote }}
      http:
        paths:
          - path: /
            backend:
              serviceName: {{ .service.name | quote }}
              servicePort: {{ .service.port }}
{{- end -}}
