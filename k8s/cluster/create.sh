#!/bin/bash

# Check if kind is installed
if ! command -v kind &> /dev/null; then
    echo "Kind is not installed. Please install Kind before running this script."
    exit 1
fi

# Define cluster configuration
cat <<EOF > kind-cluster-config.yaml
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
  - role: control-plane # Master node
  - role: worker        # Worker node 1
  - role: worker        # Worker node 2
EOF

# Create the cluster
echo "Creating Kind cluster with 1 master and 2 worker nodes..."
kind create cluster --name my-cluster --config kind-cluster-config.yaml

# Check cluster status
if [ $? -eq 0 ]; then
    echo "Kind cluster 'my-cluster' created successfully!"
    echo "To use the cluster, run: export KUBECONFIG=$(kind get kubeconfig-path --name my-cluster)"
else
    echo "Failed to create the Kind cluster."
fi

# Clean up the configuration file
rm -f kind-cluster-config.yaml
