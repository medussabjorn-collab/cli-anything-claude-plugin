# AI Creative Workflow - Quick Start Guide

Complete end-to-end pipeline combining Blender, ComfyUI, n8n, Mermaid, and Obsidian.

## 30-Second Setup

```bash
# 1. Install CLI-Anything
pip install cli-anything-hub

# 2. Install 5 CLIs
cli-hub install blender comfyui n8n mermaid obsidian

# 3. Start applications
blender &                         # 3D modeling
python main.py &                  # ComfyUI
docker run -p 5678:5678 n8nio/n8n &  # n8n
```

## What Each CLI Does

| CLI | Purpose | Commands |
|-----|---------|----------|
| **Blender** | 3D modeling & rendering | `object add`, `render execute` |
| **ComfyUI** | AI image generation | `workflow run`, `models list` |
| **n8n** | Workflow automation | `workflow list`, `execution status` |
| **Mermaid** | Process documentation | `diagram show`, `export render` |
| **Obsidian** | Knowledge management | `vault list`, `search query` |

## Quick Workflow

### Blender - Create 3D Scene
```bash
cli-anything-blender scene new --profile="product-showcase"
cli-anything-blender object add --type=cube
cli-anything-blender material create --name="metal"
cli-anything-blender render execute --output="product.png"
```

### ComfyUI - AI Enhancement
```bash
cli-anything-comfyui models checkpoints
cli-anything-comfyui workflow run workflow.json
cli-anything-comfyui queue status
```

### n8n - Automation
```bash
cli-anything-n8n health
cli-anything-n8n workflow list
cli-anything-n8n execution list
```

### Mermaid - Documentation
```bash
echo 'graph TD: A[Start] --> B[Process] --> C[End]' > diagram.mmd
cli-anything-mermaid export render diagram.svg --format=svg
cli-anything-mermaid export share --mode=edit
```

### Obsidian - Knowledge Base
```bash
cli-anything-obsidian vault create --path="Workflows/Run-001"
cli-anything-obsidian search query --query="tag:product"
cli-anything-obsidian vault read --path="Workflows/Run-001"
```

## Complete Example

```bash
# Clone repo
git clone https://github.com/medussabjorn-collab/cli-anything-claude-plugin.git
cd cli-anything-claude-plugin/examples

# Set up Obsidian
bash obsidian-vault-setup.sh

# Run workflow
bash run-complete-workflow.sh "ProductName" "Description"
```

## Batch Processing
```bash
for product in "A" "B" "C"; do
  cli-anything-blender scene new --profile="product-showcase"
  cli-anything-comfyui workflow run workflow.json
  cli-anything-obsidian vault create --path="Workflows/Run-$product"
done
```

## Search Previous Results
```bash
# Find product photography runs
cli-anything-obsidian search query --query="tag:product-photography"

# Find by date
cli-anything-obsidian search query --query="created:2026-08"

# Find by product
cli-anything-obsidian search simple --query="ProductName"
```

## Environment Variables
```bash
export COMFYUI_URL="http://localhost:8188"
export N8N_URL="http://localhost:5678"
export N8N_API_KEY="your-key"
export OBSIDIAN_HOST="https://localhost:27124"
export OBSIDIAN_API_KEY="your-key"
```

## Troubleshooting

**ComfyUI not responding?**
```bash
curl http://localhost:8188/api/interrupted
# If fails, restart ComfyUI
cd ~/ComfyUI && python main.py
```

**Obsidian API not found?**
```bash
# Enable Local REST API plugin in Obsidian app
bash obsidian-vault-setup.sh
```

**Workflow failed in n8n?**
```bash
cli-anything-n8n workflow validate --workflow-id=abc123
cli-anything-n8n execution list --filter="failed"
```

## Next Steps

- Customize workflow templates
- Set up n8n for full automation
- Add batch processing
- Create Obsidian queries for tracking
- Connect external APIs via n8n

## Resources

- GitHub: https://github.com/medussabjorn-collab/cli-anything-claude-plugin
- CLI-Anything: https://github.com/HKUDS/CLI-Anything
- Docs: See `examples/` directory

---

**Start now:**
```bash
cli-hub install blender comfyui n8n mermaid obsidian
bash examples/run-complete-workflow.sh "Your Product" "Description"
```
