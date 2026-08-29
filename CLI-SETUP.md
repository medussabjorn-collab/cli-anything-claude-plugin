# CLI Auto-Suggestion Setup

Enable automatic CLI recommendations across all Claude sessions.

## 1-Minute Setup

### Install the Plugin
```bash
# Option A: Claude Code
# Go to Settings → Plugins → Add Plugin
# Paste: https://github.com/medussabjorn-collab/cli-anything-claude-plugin
# OR: /install-plugin cli-anything-claude-plugin

# Option B: CLI
cd ~/.claude/plugins/
git clone https://github.com/medussabjorn-collab/cli-anything-claude-plugin.git
```

### Verify Installation
```bash
# Check available CLIs
cli-hub list

# Test a CLI
cli-hub install blender
blender --version
```

## How CLI Suggestions Work

### Automatic Detection
Claude analyzes your requests for keywords:
- **3D/CAD**: "model", "render", "animation" → suggests Blender
- **AI**: "generate image", "enhance", "diffusion" → suggests ComfyUI
- **Automation**: "automate", "workflow", "pipeline" → suggests n8n
- **Data**: "clean", "normalize", "reconcile" → suggests OpenRefine
- **Docs**: "document", "notes", "knowledge" → suggests Obsidian
- And 50+ more!

### What Claude Suggests
```
User: "I need to create a 3D product render"

Claude: "Blender 3D modeling detected.
  • Blender: 3D modeling & rendering
  • Mermaid: Process documentation
  
Quick start: cli-hub install blender
"
```

### Workflow Chains
When multiple CLIs work together, Claude suggests the chain:
```
Workflow: Blender → ComfyUI → n8n → Mermaid → Obsidian
  1. Blender: Create 3D model
  2. ComfyUI: AI enhancement
  3. n8n: Orchestrate pipeline
  4. Mermaid: Document process
  5. Obsidian: Store & retrieve

Setup: cli-hub install blender comfyui n8n mermaid obsidian
```

## All 50+ CLIs Available

### Core Workflow (Always Recommended)
| CLI | Purpose | Install |
|-----|---------|---------|
| **Blender** | 3D modeling, animation, rendering | `cli-hub install blender` |
| **ComfyUI** | AI image generation (Stable Diffusion) | `cli-hub install comfyui` |
| **n8n** | Workflow automation, orchestration | `cli-hub install n8n` |
| **Mermaid** | Diagrams, flowcharts, documentation | `cli-hub install mermaid` |
| **Obsidian** | Knowledge management, note-taking | `cli-hub install obsidian` |

### AI & ML
| CLI | Purpose |
|-----|---------|
| **Ollama** | Local LLM inference |
| **ChromaDB** | Vector database, embeddings |
| **Exa** | AI search engine |

### Data & Automation
| CLI | Purpose |
|-----|---------|
| **OpenRefine** | Data cleaning & transformation |
| **Browser** | Web scraping & automation |
| **Zoom** | Meeting management |
| **PM2** | Process management |

### Creative & Media
| CLI | Purpose |
|-----|---------|
| **Kdenlive** | Video editing |
| **Shotcut** | Video effects |
| **MuseScore** | Music notation |
| **Live2D** | 2D animation |

### Specialized
| CLI | Purpose |
|-----|---------|
| **CloudCompare** | 3D point cloud analysis |
| **Calibre** | eBook management |
| **Joplin** | Note sync |
| **SiyuanDB** | Knowledge graph |
| **RenderDoc** | GPU debugging |
| **LLDB** | Code debugging |

**Plus 30+ more.** Full list: `cli-hub list`

## Common Workflows

### Product Photography
```bash
# Blender creates 3D model
blender scene new --profile="product-showcase"

# ComfyUI enhances with AI
cli-anything-comfyui workflow run workflow.json

# Obsidian documents results
cli-anything-obsidian vault create --path="Products/render-001"
```

### Data Processing
```bash
# OpenRefine cleans data
cli-hub install openrefine

# ChromaDB stores embeddings
cli-hub install chromadb

# Search & retrieve
cli-anything-chromadb query --query="similar items"
```

### Full Automation Pipeline
```bash
# Setup all 5 core CLIs
cli-hub install blender comfyui n8n mermaid obsidian

# Run complete workflow
cd examples/
bash run-complete-workflow.sh "ProductName" "Description"
```

### Brainstorm → Document → Archive
```bash
# Brainstorm ideas
cli-anything-mubu create --type="mindmap" --title="Project Ideas"

# Document in Obsidian
cli-anything-obsidian vault create --path="Projects/Ideas"

# Diagram process
cli-anything-mermaid export render ideas.svg
```

## Configuration

### Change Default Behavior

#### Disable Suggestions
```
Tell Claude: "stop suggesting CLIs" or "normal mode"
```

#### Enable Only Specific CLIs
Edit `~/.claude/cli-suggester.json`:
```json
{
  "enable": true,
  "activeClIs": ["blender", "comfyui", "n8n", "obsidian", "mermaid"],
  "autoInstall": false,
  "verbose": true
}
```

#### Auto-Install Missing CLIs
```
Tell Claude: "auto-install suggested CLIs"
Claude will run: cli-hub install [CLI_NAME]
```

### Performance Tuning

#### Batch Installation (Faster)
```bash
# Install multiple CLIs at once (parallelized)
cli-hub install blender comfyui n8n mermaid obsidian

# Instead of one-by-one:
cli-hub install blender
cli-hub install comfyui
...
```

#### Skip Large CLIs
```bash
# Some CLIs require large downloads (Blender: 4GB, ComfyUI: 2GB)
# Configure: cli-hub config skip-large-downloads=true
```

## Troubleshooting

### "CLI not found"
```bash
# Make sure it's installed
cli-hub list | grep [CLI_NAME]

# Install it
cli-hub install [CLI_NAME]
```

### "Claude not suggesting CLIs"
```
Your issue: Claude stopped suggesting.
Fix:
1. Tell Claude: "activate cli-suggester"
2. Ask about a task (e.g., "help me create a 3D model")
3. Claude should suggest Blender
```

### "Installation takes too long"
```bash
# Check what's installing
ps aux | grep cli-hub

# Some CLIs require large downloads (4GB+)
# You can continue working while installation happens in background

# Check status
cli-hub status
```

## Uninstall / Disable

### Disable CLI Suggestions (Keep CLIs)
```
Tell Claude: "stop suggesting CLIs" or "normal mode"
Suggestions turned off but CLIs stay installed.
```

### Uninstall Specific CLI
```bash
cli-hub uninstall [CLI_NAME]

# Example
cli-hub uninstall blender
```

### Disable Plugin Entirely
```bash
# In Claude Code Settings:
# Plugins → CLI-Anything → Disable
```

## Next Steps

1. **Start small**: Install 1-2 CLIs (Mermaid + Obsidian are lightweight)
2. **Try a workflow**: `bash examples/run-complete-workflow.sh`
3. **Explore**: Ask Claude about your next task — it'll suggest CLIs
4. **Learn**: Read each CLI's documentation: `cli-hub help [CLI_NAME]`

## Support

- **GitHub**: https://github.com/medussabjorn-collab/cli-anything-claude-plugin
- **Issues**: Report bugs at GitHub Issues
- **Docs**: Full docs at repo README
- **Examples**: See `examples/` directory for complete workflows

## Quick Reference Commands

```bash
# List all CLIs
cli-hub list

# Install CLI
cli-hub install [CLI_NAME]

# Uninstall CLI
cli-hub uninstall [CLI_NAME]

# Get CLI help
cli-hub help [CLI_NAME]

# Check CLI version
cli-hub version [CLI_NAME]

# Search CLIs
cli-hub search [KEYWORD]

# View installed CLIs
cli-hub installed

# Update CLIs
cli-hub update

# System status
cli-hub status
```

---

**Ready?** Tell Claude: "I want to create a 3D render" — it'll suggest Blender + set up the workflow.
