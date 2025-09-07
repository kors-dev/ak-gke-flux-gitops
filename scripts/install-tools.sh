#!/usr/bin/env bash
set -euo pipefail

# OpenTofu (IaC)
curl -fsSL https://get.opentofu.org/install-opentofu.sh | sh -s -- --install-method standalone

# kubectl (останній стабільний)
curl -L -o /tmp/kubectl "https://dl.k8s.io/release/$(curl -Ls https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
install -m 0755 /tmp/kubectl /usr/local/bin/kubectl

# k9s   (керування k8s з терміналу)  
curl -sS https://webi.sh/k9s | sh
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc

# cloud-provider-kind (лоад-балансер для KinD)
mkdir -p /go/bin
cd /tmp
wget -q https://github.com/kubernetes-sigs/cloud-provider-kind/releases/download/v0.6.0/cloud-provider-kind_0.6.0_linux_amd64.tar.gz
tar -xzf cloud-provider-kind_0.6.0_linux_amd64.tar.gz -C /go/bin
