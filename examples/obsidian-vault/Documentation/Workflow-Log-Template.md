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
