#!/bin/bash

set -Eeou pipefail

NAMESPACE="monitoring"
CHART_NAME="monitoring-stack"
DEPLOYMENTS=("monitoring-grafana" "monitoring-kube-prometheus-operator" "monitoring-kube-state-metrics")

# Create Helm Chart structure
helm create "$CHART_NAME"
rm -rf "$CHART_NAME/templates/*"  # Remove default template files

# Extract Deployments and parameterize them
for DEPLOYMENT in "${DEPLOYMENTS[@]}"; do
    YAML_FILE="$CHART_NAME/templates/$DEPLOYMENT.yaml"
    
    # Retrieve the Deployment YAML from Kubernetes
    kubectl get deployment "$DEPLOYMENT" -n "$NAMESPACE" -o yaml > "$YAML_FILE"

    # Use yq to replace static values with Helm template variables
    yq -i '
        .metadata.name = "{{ .Release.Name }}-'$DEPLOYMENT'" |
        .metadata.namespace = "{{ .Values.namespace }}" |
        .spec.replicas = "{{ .Values.'$DEPLOYMENT'.replicas }}"
    ' "$YAML_FILE"

    # Append values to values.yaml
    echo "$DEPLOYMENT:" >> "$CHART_NAME/values.yaml"
    echo "  replicas: 1" >> "$CHART_NAME/values.yaml"
done

# Add namespace to values.yaml
echo "namespace: $NAMESPACE" >> "$CHART_NAME/values.yaml"

echo "✅ Helm Chart has been successfully generated in $CHART_NAME"
