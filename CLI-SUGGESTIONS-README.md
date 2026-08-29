# CLI Auto-Suggestion System

**Automatic CLI recommendations across all Claude sessions.** When you ask Claude for help with 3D modeling, AI images, automation, data processing, or documentation, Claude instantly suggests the best CLIs and provides setup instructions.

## What This Does

### Before (Manual)
```
User: "I need to create a 3D product render"
Claude: (generic response, no tool suggestions)
```

### After (Auto-Suggested)
```
User: "I need to create a 3D product render"
Claude: "3D task detected. Recommended CLIs:
  • Blender: 3D modeling & rendering
  • Mermaid: Process documentation
  
Quick start: cli-hub install blender
"
```

## How It Works

### 1. Keyword Detection
Claude analyzes requests for task keywords:
- **3D/CAD**: model, render, animation, visualization → Blender
- **AI**: image, generate, enhance, diffusion → ComfyUI
- **Automate**: workflow, pipeline, orchestrate → n8n
- **Data**: clean, transform, reconcile → OpenRefine
- **Docs**: document, notes, organize → Obsidian
- **Video**: edit, produce, effects → Kdenlive
- Plus 40+ more keywords

### 2. Suggestion Engine
Matches keywords to CLI registry with 50+ tools:
```
3D task?
├─ Primary: Blender
├─ Support: 3MF (export), CloudCompare (analysis)
└─ Workflow: Blender → Mermaid → Obsidian
```

### 3. Proactive Activation
When keywords match:
- Suggest relevant CLI(s)
- Show installation command
- Provide quick start example
- Recommend workflow chains

## Installation

### Option 1: Claude Code Plugin (1 click)
```bash
# In Claude Code
Settings → Plugins → Add Plugin → https://github.com/medussabjorn-collab/cli-anything-claude-plugin
```

### Option 2: CLI Install
```bash
claude plugin install cli-anything
```

### Option 3: Manual
```bash
cd ~/.claude/plugins/
git clone https://github.com/medussabjorn-collab/cli-anything-claude-plugin.git
```

**Full setup guide**: [CLI-SETUP.md](CLI-SETUP.md)

## Usage Examples

### Example 1: 3D Modeling
```
You: "I want to create a 3D product render"

Claude: "Blender 3D detected.
Suggested workflow:
  1. Blender → Create 3D model
  2. Mermaid → Document process
  3. Obsidian → Store results

Install: cli-hub install blender mermaid obsidian
Quick start: blender scene new --profile='product-showcase'
"
```

### Example 2: AI Image Generation
```
You: "Generate AI images for our products"

Claude: "ComfyUI + Obsidian detected.
Workflow:
  1. ComfyUI → Generate images (SDXL)
  2. Obsidian → Store & organize

Install: cli-hub install comfyui obsidian
Run: cli-anything-comfyui workflow run workflow.json
"
```

### Example 3: Full Automation Pipeline
```
You: "Automate our product photography workflow"

Claude: "Complete workflow detected.
Pipeline:
  1. Blender → Create 3D models
  2. ComfyUI → AI image enhancement
  3. n8n → Orchestrate pipeline
  4. Mermaid → Document process
  5. Obsidian → Store & retrieve

Install all: cli-hub install blender comfyui n8n mermaid obsidian
Run demo: bash examples/run-complete-workflow.sh
"
```

### Example 4: Data Processing
```
You: "Clean and normalize our customer data"

Claude: "Data processing detected.
Suggested stack:
  • OpenRefine → Data cleaning & transformation
  • ChromaDB → Store cleaned data
  • Obsidian → Document data quality report

Install: cli-hub install openrefine chromadb
"
```

## All 50+ Available CLIs

| Category | CLIs |
|----------|------|
| **3D & CAD** | Blender, 3MF, CloudCompare, FreeCAD, Meerk40T |
| **AI & ML** | ComfyUI, Ollama, Suno, Novita, MiniMax, NotebookLM |
| **Automation** | n8n, MacroCLI, Browser, Zoom |
| **Data** | OpenRefine, ChromaDB, Exa |
| **Diagramming** | Mermaid, Mubu |
| **Docs & Notes** | Obsidian, Joplin, SiyuanDB, Calibre |
| **Media** | Kdenlive, Shotcut, MuseScore, Live2D |
| **Dev Tools** | LLDB, RenderDoc, PM2 |
| **Plus** | 25+ more across audio, browser, communication, etc. |

**View all**: `cli-hub list` or run after installing.

## Configuration

### Enable/Disable Suggestions
```
Tell Claude: "turn off CLI suggestions"
Tell Claude: "activate CLI suggestions"
```

### Auto-Install Missing CLIs
```
Tell Claude: "auto-install suggested CLIs"
```

### Show Only Specific CLIs
Edit `~/.claude/cli-suggester.json`:
```json
{
  "enabled": true,
  "activeClIs": ["blender", "comfyui", "n8n", "obsidian", "mermaid"],
  "autoInstall": false
}
```

## Workflow Chains (Pre-Built)

| Goal | Chain | Install |
|------|-------|---------|
| Create & render 3D | Blender → Mermaid | `cli-hub install blender mermaid` |
| Generate AI images | ComfyUI → Obsidian | `cli-hub install comfyui obsidian` |
| Automate everything | n8n → Obsidian → Mermaid | `cli-hub install n8n obsidian mermaid` |
| Clean data | OpenRefine → ChromaDB | `cli-hub install openrefine chromadb` |
| Brainstorm & organize | Mubu → Obsidian | `cli-hub install mubu obsidian` |
| Edit video | Kdenlive → Obsidian | `cli-hub install kdenlive obsidian` |
| Local AI ops | Ollama → ChromaDB → Obsidian | `cli-hub install ollama chromadb obsidian` |
| **Full creative** | Blender→ComfyUI→n8n→Mermaid→Obsidian | `cli-hub install blender comfyui n8n mermaid obsidian` |

## How to Activate

### Auto-Activate (Recommended)
Just ask Claude about your task:
```
"I need to create a 3D model"
```
Claude will automatically detect and suggest Blender.

### Manual Activation
```
Tell Claude: "Use the cli-suggester skill"
```

### Disable/Stop
```
Tell Claude: "stop suggesting CLIs" or "normal mode"
```

## Integration with Other Systems

### Works With
- **Claude Code** (plugin)
- **Copilot** (via skills)
- **Cursor** (via rules)
- **Windsurf** (via skills)
- **Cline** (via .clinerules)
- **OpenHands** (via rules)
- **Other agents** (via AGENTS.md)

### Preserves
- Caveman mode (terse suggestions)
- Security review prompts
- Multi-step confirmations
- User preferences

## Troubleshooting

### "Claude not suggesting CLIs"
1. Tell Claude: "activate cli-suggester"
2. Ask about a task (e.g., "help me create a 3D model")
3. Claude should suggest Blender

### "CLI installation fails"
```bash
# Check if CLI-Anything is installed
cli-hub list

# If missing, install:
npm install -g @cli-anything/hub

# Retry installation:
cli-hub install [CLI_NAME] --verbose
```

### "Suggestions turned off"
```
Tell Claude: "activate CLI suggestions"
```

See full troubleshooting: [CLI-ACTIVATION.md](CLI-ACTIVATION.md)

## Quick Start

1. **Install plugin**: `claude plugin install cli-anything`
2. **Ask Claude**: "I want to create a diagram"
3. **Install suggested CLI**: `cli-hub install mermaid`
4. **Try it**: `cli-anything-mermaid --help`
5. **Explore**: `cli-hub list` (all 50+ CLIs)

## Documentation

- **[CLI-SETUP.md](CLI-SETUP.md)**: Installation, configuration, all CLIs reference
- **[CLI-ACTIVATION.md](CLI-ACTIVATION.md)**: Activation methods, hooks, troubleshooting
- **[skills/cli-suggester.md](skills/cli-suggester.md)**: Suggestion engine details
- **[examples/](examples/)**: Complete workflow demos

## Repository

- **GitHub**: https://github.com/medussabjorn-collab/cli-anything-claude-plugin
- **Issues**: Report bugs at GitHub Issues
- **Upstream CLI-Anything**: https://github.com/HKUDS/CLI-Anything

## Memory System

The CLI recommendation system is documented in persistent memory so it activates automatically in future sessions:
- **Memory file**: `~/.claude/projects/[project]/memory/cli-recommendation-system.md`
- **Memory index**: Updated in `MEMORY.md`

Each Claude session will auto-load this context and activate CLI suggestions based on task keywords.

## Next Steps

1. **Install plugin**: Takes 30 seconds
2. **Start asking**: "Help me with [task]"
3. **Claude suggests**: Relevant CLIs + installation
4. **Install & run**: `cli-hub install [CLI]`
5. **Execute workflow**: Use provided commands

---

**Status**: ✅ Complete. 50+ CLIs auto-suggested across all sessions. Ready for production use.
