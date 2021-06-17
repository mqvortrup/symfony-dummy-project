{{- define "loadbalancer.template" -}}
apiVersion: v1
kind: Service
metadata:
  name: {{ .service.name | quote }}
spec:
  type: LoadBalancer
  ports:
  - port: 80
  selector:
    app: public-app
    
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
