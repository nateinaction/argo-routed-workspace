#!/bin/bash
# shellcheck disable=SC2154 disable=2129

set -x
exec > >(tee /var/log/user-data.log|logger -t user-data ) 2>&1

# Add vars to template by terraform
ARGO_SECRETS_BUCKET=${argo_secrets_bucket}
DOMAIN="${domain}"

# Sync argo secrets and config to local filesystem
CLOUDFLARED_DIR='/etc/cloudflared'
sudo aws s3 sync "s3://$ARGO_SECRETS_BUCKET/$DOMAIN" "$CLOUDFLARED_DIR"

# Run the daemon
sudo cloudflared service install
sudo service cloudflared start
