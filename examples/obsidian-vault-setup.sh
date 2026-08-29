#!/bin/bash
# Obsidian Vault Setup for AI Creative Workflow

VAULT_DIR="${1:-.}/obsidian-vault"
mkdir -p "$VAULT_DIR"/{Projects/AI-Creative,Workflows/Runs,Assets/{Models,Images},Documentation}

# Create project index
cat > "$VAULT_DIR/Projects/AI-Creative/Index.md" << 'INDEX'
# AI Creative Workflow Project

## Status: Active

## Components
- [[../../Workflows/Runs/|Workflow Runs]]
- [[../../Assets/Models/|3D Models]]
- [[../../Assets/Images/|AI Images]]

## Latest Runs
- Automatically populated from Workflows/Runs/

## Tags
#ai-creative #automation #product-photography
INDEX

# Create workflow template
cat > "$VAULT_DIR/Documentation/Workflow-Log-Template.md" << 'TEMPLATE'
# Workflow Execution Log

Date: {{DATE}}
Workflow ID: {{ID}}

## Input
- Product: {{PRODUCT}}
- Description: {{DESCRIPTION}}

## Execution Steps

### Blender
- Status: {{BLENDER_STATUS}}
- Output: {{BLENDER_OUTPUT}}

### ComfyUI
- Status: {{COMFYUI_STATUS}}
- Output: {{COMFYUI_OUTPUT}}

### n8n
- Status: {{N8N_STATUS}}
- Compile: {{N8N_OUTPUT}}

## Results
- Model: [[../Assets/Models/{{ID}}.blend]]
- Image: [[../Assets/Images/{{ID}}.png]]

## Duration
Total: {{DURATION}}s

Tags: #workflow #complete
TEMPLATE

echo "✓ Vault created at: $VAULT_DIR"
echo "✓ Structure: Projects, Workflows, Assets, Documentation"
