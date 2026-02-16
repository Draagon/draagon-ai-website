#!/bin/bash
# Deploy draagon.ai to Cloudflare Pages
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source ~/.config/cloudflare/credentials

CLOUDFLARE_EMAIL="$CF_EMAIL" \
CLOUDFLARE_API_KEY="$CF_KEY" \
CLOUDFLARE_ACCOUNT_ID="$CF_ACCOUNT" \
wrangler pages deploy "$SCRIPT_DIR" \
  --project-name=draagon-ai \
  --branch=main \
  --commit-message="Deploy $(date +%Y-%m-%d\ %H:%M:%S)"

echo "Deployed to https://draagon.ai"
