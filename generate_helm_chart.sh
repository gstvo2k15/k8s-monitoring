#!/bin/bash

set -Eeou pipefail

NAMESPACE="monitoring"
CHART_NAME="monitoring-stack"
DEPLOYMENTS=("monitoring-grafana" "monitoring-kube-prometheus-operator" "monitoring-kube-state-metrics")

# 1. Crear la estructura del Helm Chart
helm create "$CHART_NAME"
rm -rf "$CHART_NAME/templates/*"

# 2. Obtener Deployments y parametrizar
for DEPLOYMENT in "${DEPLOYMENTS[@]}"; do
    kubectl get deployment "$DEPLOYMENT" -n "$NAMESPACE" -o yaml > "$CHART_NAME/templates/$DEPLOYMENT.yaml"

    # Parametrizar el YAML con yq
    yq eval -i "
        .metadata.name = \"{{ .Release.Name }}-$DEPLOYMENT\" |
        .metadata.namespace = \"{{ .Values.namespace }}\" |
        .spec.replicas = \"{{ .Values.$DEPLOYMENT.replicas }}\"
    " "$CHART_NAME/templates/$DEPLOYMENT.yaml"

    echo "$DEPLOYMENT:" >> "$CHART_NAME/values.yaml"
    echo "  replicas: 1" >> "$CHART_NAME/values.yaml"
done

# 3. Agregar namespace en values.yaml
echo "namespace: $NAMESPACE" >> "$CHART_NAME/values.yaml"

echo "✅ Helm Chart generado en $CHART_NAME"
