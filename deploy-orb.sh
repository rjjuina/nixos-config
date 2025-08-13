#!/usr/bin/env bash

# Deploy NixOS configuration to OrbStack VM using remote building
# Usage: ./deploy-orb.sh [nixos|rmini-nixos]

set -e

# Configuration
VM_NAME="${1:-nixos}"
REPO_PATH="/home/halston/nixos-config"

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${GREEN}🚀 Deploying to ${VM_NAME} using remote build...${NC}"

# Step 1: Copy the flake to the remote machine
echo -e "${YELLOW}📦 Copying configuration to ${VM_NAME}...${NC}"
rsync -av --delete \
  --exclude='.git' \
  --exclude='result' \
  --exclude='*.swp' \
  --exclude='.DS_Store' \
  ./ "halston@${VM_NAME}@orb:${REPO_PATH}/"

# Step 2: Build and switch on the remote machine
echo -e "${YELLOW}🔧 Building and switching on ${VM_NAME}...${NC}"
ssh "halston@${VM_NAME}@orb" << EOF
set -e
cd ${REPO_PATH}
echo "Building configuration for ${VM_NAME}..."
sudo nixos-rebuild switch --flake ".#${VM_NAME}" --impure
EOF

echo -e "${GREEN}✅ Successfully deployed to ${VM_NAME}!${NC}"