#!/usr/bin/env bash
set -eEou pipefail

###############################################################################
# Este script despliega Prometheus, Grafana y ELK en NodePorts dentro de
# un namespace llamado 'observability'. Usa Helm y repos oficiales.
#
# Requisitos previos:
# - kubectl y helm instalados
# - Conexión al cluster configurada (kubectl context correcto)
###############################################################################

# 1) Crear el namespace 'observability' (si no existe)
kubectl create namespace observability 2>/dev/null || true

# 2) Añadir repositorios de Helm
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add grafana https://grafana.github.io/helm-charts
helm repo add elastic https://helm.elastic.co
helm repo update

# 3) Crear los values de Prometheus en un archivo temporal
cat <<EOF > /tmp/values-prometheus.yaml
# values-prometheus.yaml
# NodePort para Prometheus Stack
service:
  type: NodePort
  nodePort: 32000

prometheus:
  prometheusSpec:
    serviceSpec:
      type: NodePort
      nodePort: 32002

alertmanager:
  alertmanagerSpec:
    serviceSpec:
      type: NodePort
      nodePort: 32003
EOF

# 4) Crear los values de Grafana
cat <<EOF > /tmp/values-grafana.yaml
# values-grafana.yaml
service:
  type: NodePort
  nodePort: 32001

# Credenciales por defecto
adminUser: admin
adminPassword: admin123

# (Ejemplo) Persistencia desactivada
persistence:
  enabled: false
EOF

# 5) Crear los values de Elasticsearch
cat <<EOF > /tmp/values-elasticsearch.yaml
# values-elasticsearch.yaml
service:
  type: NodePort
  nodePort: 32010

# (Ejemplo) Volumen en 10Gi
volumeClaimTemplate:
  accessModes: [ "ReadWriteOnce" ]
  resources:
    requests:
      storage: 10Gi
EOF

# 6) Crear los values de Logstash
cat <<EOF > /tmp/values-logstash.yaml
# values-logstash.yaml
service:
  type: NodePort
  nodePort: 32011

replicas: 1
resources:
  requests:
    memory: 512Mi
    cpu: 250m
EOF

# 7) Crear los values de Kibana
cat <<EOF > /tmp/values-kibana.yaml
# values-kibana.yaml
service:
  type: NodePort
  nodePort: 32012

resources:
  requests:
    memory: 512Mi
    cpu: 250m
EOF

# 8) Instalar Prometheus Stack (kube-prometheus-stack)
helm install prometheus prometheus-community/kube-prometheus-stack \
  --namespace observability \
  -f /tmp/values-prometheus.yaml \
  --wait

# 9) Instalar Grafana
helm install grafana grafana/grafana \
  --namespace observability \
  -f /tmp/values-grafana.yaml \
  --wait

# 10) Instalar Elasticsearch
helm install elasticsearch elastic/elasticsearch \
  --namespace observability \
  -f /tmp/values-elasticsearch.yaml \
  --wait

# 11) Instalar Logstash
helm install logstash elastic/logstash \
  --namespace observability \
  -f /tmp/values-logstash.yaml \
  --wait

# 12) Instalar Kibana
helm install kibana elastic/kibana \
  --namespace observability \
  -f /tmp/values-kibana.yaml \
  --wait

###############################################################################
# FIN
###############################################################################
echo
echo "========================================================="
echo "¡Despliegue completado!"
echo "NodePorts asignados (asumiendo un solo nodo):"
echo " - Prometheus Stack:        <NodeIP>:32000 / 32002 / 32003"
echo " - Grafana:                 <NodeIP>:32001"
echo " - Elasticsearch:           <NodeIP>:32010"
echo " - Logstash:                <NodeIP>:32011"
echo " - Kibana:                  <NodeIP>:32012"
echo
echo "Para ver los pods:     kubectl get pods -n observability"
echo "Para ver los services: kubectl get svc  -n observability"
echo "========================================================="
