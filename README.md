# CLI-Anything Claude Code Plugin Bundle

Build powerful, stateful CLI interfaces for any GUI application.

## Complete Package

- **85 Agent-Ready CLIs** pre-configured for Claude Code
- **15+ Categories** across design, development, automation, and more
- **Zero Setup** - Works immediately after installation

## All 85 CLIs

### 3D & CAD (5)
blender, freecad, 3mf, cloudcompare, meerk40t

### AI & ML (9)
comfyui, ollama, minimax, suno, notebooklm, novita, generate-veo-video, jimeng, magnific

### Audio & Music (4)
audacity, wavetone, elevenlabs

### Automation & Integration (2)
n8n, eez-studio

### Browser & Web (5)
browser, browser-cdp, clibrowser, cloakbrowser, web-yu-pri

### Communication (4)
feishu, wecom, ve-twini, x-twitter-scraper

### Data & Storage (5)
chromadb, contentful, exa, firefly-iii, py4csr

### Design & Graphics (5)
gimp, krita, inkscape, sketch, inkstitch

### Development Tools (5)
lldb, renderdoc, nsight-graphics, sentry, deployhq

### Diagramming (4)
mermaid, drawio, mubu, siyuan

### Documents & Knowledge (4)
libreoffice, calibre, obsidian, zotero

### Gaming & 3D (2)
godot, slay_the_spire_ii

### GIS & Mapping (2)
qgis, arcgis-pro

### Media & Video (4)
kdenlive, obs-studio, videocaptioner, vivideo

### Office & Productivity (10)
obsidian, obsidian-cli, obsidian-agent-cli, joplin, iterm2, sanity, shopify, calibre, libreoffice

### Security & Identity (3)
1password-cli, quietshrink, cc-switch

### Statistics & Data (1)
stata

### Miscellaneous (8)
anygen, android-cli, eth2-quickstart, hacker-feeds-cli, nslogger, pieces, smithue-cli, tinyfish

## Auto-Suggestion System ⚡

Claude now **automatically suggests relevant CLIs** based on your requests!

### How It Works
Ask Claude about your task → Claude detects keywords → Suggests best CLIs + workflow chains

### Examples
```
You: "I need to create a 3D product render"
Claude: "Blender + Mermaid detected.
         Install: cli-hub install blender mermaid
         Quick start: blender scene new ..."

You: "Generate AI images for our products"  
Claude: "ComfyUI workflow ready.
         Install: cli-hub install comfyui obsidian"

You: "Automate our product photography"
Claude: "Full pipeline: Blender→ComfyUI→n8n→Mermaid→Obsidian
         Install all: cli-hub install blender comfyui n8n mermaid obsidian"
```

### Detected Keywords
- **3D**: model, render, animation, visualization
- **AI**: image, generate, enhance, diffusion
- **Automate**: workflow, pipeline, orchestrate
- **Data**: clean, transform, reconcile
- **Docs**: document, notes, organize
- **Video**: edit, produce, effects
- **Plus 40+ more** keywords across all categories

**Learn more**: [CLI-SUGGESTIONS-README.md](CLI-SUGGESTIONS-README.md)

## Quick Installation

```bash
# Option 1: Claude Code Plugin
Settings → Plugins → Add Plugin → https://github.com/medussabjorn-collab/cli-anything-claude-plugin

# Option 2: CLI
claude plugin install cli-anything

# Option 3: Manual
cp -r C:\Dev\CLI-Anything-Claude-Plugin ~/.claude/plugins/cli-anything
```

## Usage

```bash
# List all CLIs
cli-hub list

# Get info about a CLI
cli-hub info blender

# Install if not pre-installed
cli-hub install blender

# Launch CLI
cli-hub launch blender
```

## Categories

- **3D/CAD**: Blender, FreeCAD, CloudCompare
- **AI/ML**: ComfyUI, Ollama, Minimax, Suno
- **Audio**: Audacity, Wavetone, ElevenLabs  
- **Design**: GIMP, Krita, Inkscape
- **Dev Tools**: LLDB, RenderDoc, Nsight
- **Diagramming**: Mermaid, Draw.io
- **GIS**: QGIS, ArcGIS Pro
- **Media**: Kdenlive, OBS Studio
- **Office**: LibreOffice, Calibre
- **Productivity**: Obsidian, Joplin
- **Web**: Dify, OpenRefine, OpenWebUI

## Pre-Built Workflow Chains

Common tasks with suggested CLIs:

| Goal | CLIs | Install |
|------|------|---------|
| 3D model + render | Blender, Mermaid | `cli-hub install blender mermaid` |
| AI images + storage | ComfyUI, Obsidian | `cli-hub install comfyui obsidian` |
| Automate everything | n8n, Obsidian, Mermaid | `cli-hub install n8n obsidian mermaid` |
| Data pipeline | OpenRefine, ChromaDB | `cli-hub install openrefine chromadb` |
| Brainstorm→archive | Mubu, Obsidian | `cli-hub install mubu obsidian` |
| Video production | Kdenlive, Obsidian | `cli-hub install kdenlive obsidian` |
| Local AI operations | Ollama, ChromaDB, Obsidian | `cli-hub install ollama chromadb obsidian` |
| **Full creative pipeline** | Blender, ComfyUI, n8n, Mermaid, Obsidian | `cli-hub install blender comfyui n8n mermaid obsidian` |

## Documentation

- **[CLI-SUGGESTIONS-README.md](CLI-SUGGESTIONS-README.md)** — Complete auto-suggestion system guide
- **[CLI-SETUP.md](CLI-SETUP.md)** — Installation, configuration, all CLIs reference
- **[CLI-ACTIVATION.md](CLI-ACTIVATION.md)** — Activation methods, hooks, troubleshooting
- **[GitHub](https://github.com/HKUDS/CLI-Anything)** — Original CLI-Anything repository
- **[examples/](examples/)** — Complete workflow demonstrations

## License

Apache 2.0

---
Total CLIs: 85
Generated: 2026-08-29
