#!/bin/bash
# shellcheck disable=SC2154 disable=2129

set -x
exec > >(tee /var/log/user-data.log|logger -t user-data ) 2>&1

# Add vars to template by terraform
ARGO_SECRETS_BUCKET=${argo_secrets_bucket}

# Install packages
apt-get update
DEBIAN_FRONTEND=noninteractive DEBIAN_PRIORITY=critical apt-get install --no-install-recommends -y \
  build-essential \
  ca-certificates \
  curl \
  git \
  sudo \
  tmux \
  vim

# Install cloudflared
curl "https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-amd64.deb" -o cloudflared.deb
dpkg -i cloudflared.deb
rm -rf cloudflared.deb

# Sync argo secrets and config to local filesystem
CLOUDFLARED_DIR='~/.cloudflared/'
aws s3 sync "s3://$ARGO_SECRETS_BUCKET" "$CLOUDFLARED_DIR"

# Run the daemon
cloudflared service install
