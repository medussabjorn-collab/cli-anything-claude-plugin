---
name: cli-suggester
description: Automatically suggests and activates relevant CLIs based on task context and keywords
---

# CLI Auto-Suggester

Proactive CLI recommendation engine for all Claude sessions.

## How It Works

When user requests align with CLI capabilities:
1. **Detect keywords** in prompt (3D, AI image, automate, diagram, notes, etc.)
2. **Match CLIs** from registry (50+ installed)
3. **Suggest chains** (common workflows)
4. **Offer installation** if not ready

## Keyword Triggers → CLI Suggestions

### 3D & CAD
- Keywords: "model", "render", "3D", "CAD", "visualization", "animation", "point cloud"
- Suggest: `Blender` (primary) + `3MF` (export) + `CloudCompare` (analysis)
- Install: `cli-hub install blender`

### AI & Image Generation
- Keywords: "AI image", "generate", "enhance", "diffusion", "art", "photograph"
- Suggest: `ComfyUI` (primary) + `Mermaid` (document)
- Install: `cli-hub install comfyui`

### Automation & Workflows
- Keywords: "automate", "workflow", "pipeline", "orchestrate", "loop", "integrate"
- Suggest: `n8n` (primary) + `Obsidian` (log)
- Install: `cli-hub install n8n`

### Data Processing
- Keywords: "clean data", "transform", "normalize", "reconcile", "quality"
- Suggest: `OpenRefine` (primary) + `ChromaDB` (store)
- Install: `cli-hub install openrefine chromadb`

### Documentation & Knowledge
- Keywords: "document", "notes", "knowledge base", "organize", "archive", "diagram"
- Suggest: `Obsidian` (primary) + `Mermaid` (visualize) + `Mubu` (brainstorm)
- Install: `cli-hub install obsidian mermaid`

### Video & Media
- Keywords: "video", "edit", "post-production", "effects", "audio", "codec"
- Suggest: `Kdenlive` (primary) + `Shotcut` (effects)
- Install: `cli-hub install kdenlive shotcut`

### Brainstorming & Ideation
- Keywords: "brainstorm", "ideas", "outline", "structure", "mind map"
- Suggest: `Mubu` (primary) + `Obsidian` (capture)
- Install: `cli-hub install mubu`

### Advanced AI (Local)
- Keywords: "local LLM", "private AI", "embeddings", "vector search", "RAG"
- Suggest: `Ollama` (LLM) + `ChromaDB` (store)
- Install: `cli-hub install ollama chromadb`

## Workflow Chains (Suggest These)

| User Goal | CLI Chain | Command |
|-----------|-----------|---------|
| Create product render | Blender → Mermaid | `cli-hub install blender mermaid` |
| Generate AI images | ComfyUI → Obsidian | `cli-hub install comfyui obsidian` |
| Automate everything | n8n → Obsidian → Mermaid | `cli-hub install n8n obsidian mermaid` |
| Clean & organize data | OpenRefine → ChromaDB | `cli-hub install openrefine chromadb` |
| Brainstorm & document | Mubu → Obsidian | `cli-hub install mubu obsidian` |
| Edit video | Kdenlive → Obsidian | `cli-hub install kdenlive obsidian` |
| Local AI pipeline | Ollama → ChromaDB → Obsidian | `cli-hub install ollama chromadb obsidian` |
| Full creative flow | Blender → ComfyUI → n8n → Mermaid → Obsidian | `cli-hub install blender comfyui n8n mermaid obsidian` |

## Response Format

### Quick Suggestion
```
💡 Detected [TASK]: Suggested CLIs:
  • [PRIMARY_CLI]: [use case]
  • [SUPPORT_CLI]: [use case]

Quick start: cli-hub install [PRIMARY_CLI]
```

### With Workflow Chain
```
🔗 Workflow chain for [GOAL]:
  1. [CLI1] — [step]
  2. [CLI2] — [step]
  3. [CLI3] — [step]

Setup: cli-hub install [CLI1] [CLI2] [CLI3]
Run: bash examples/run-workflow.sh
```

### If Not Installed
```
❌ [CLI] not installed. Need it for [task].

Install now: cli-hub install [CLI]
Then: [quick command]
```

## Decision Tree

```
User request received
  ↓
Extract keywords
  ↓
Match against CLI registry
  ↓
  ├─ Match found?
  │   ├─ Yes: Check if installed
  │   │   ├─ Yes: Suggest usage
  │   │   └─ No: Offer installation
  │   └─ No: Continue without suggestion
  ↓
Suggest workflow chain if relevant
  ↓
Offer quick command
```

## Integration with Caveman Mode

When caveman mode active:
- Keep suggestions terse: `Blender: 3D modeling. Install: cli-hub install blender`
- Skip explanations unless asked
- Use emoji for quick scanning
- Preserve technical accuracy

## Proactive Activation

Suggest CLIs when:
- User mentions task matching CLI keyword
- Multiple CLIs work together (offer chain)
- User building multi-step process (suggest full pipeline)
- User stuck (recommend related CLI for acceleration)

NOT suggested when:
- User explicitly said "no tools"
- Task explicitly excludes CLI usage
- CLIs not relevant to core problem

## All Available CLIs (Quick Reference)

**Always ready:**
- Blender, ComfyUI, n8n, Mermaid, Obsidian (core five)
- Ollama, ChromaDB, OpenRefine, Exa
- Kdenlive, Shotcut, CloudCompare, Mubu
- Joplin, Calibre, MuseScore, Zoom, PM2
- SiyuanDB, LLDB, RenderDoc, Live2D, UnimolTools
- 3MF, Browser, MacroCLI, Zoom, Trae, Warp
- Plus 25+ more across development, automation, media

**Not installed yet:**
- Audacity, ElevenLabs, Android CLI, Figma, DrawIO
- Email automation, voice synthesis, AR tools
- Install on-demand: `cli-hub install [name]`

## Usage Examples

### User: "I need to create a 3D product render"
Response:
```
Blender + Mermaid detected.
Install: cli-hub install blender
Quick: blender scene new --profile="product-showcase"
```

### User: "How do I automate this workflow?"
Response:
```
n8n workflow orchestration ready.
Chain: n8n → Obsidian (log) → Mermaid (diagram)
Setup: cli-hub install n8n obsidian mermaid
```

### User: "Generate AI images for our product"
Response:
```
ComfyUI + Obsidian workflow.
Install: cli-hub install comfyui obsidian
Run: cli-anything-comfyui workflow run workflow.json
Store: cli-anything-obsidian vault create --path="Images"
```

## Future Enhancements

- [ ] Track which CLIs user prefers
- [ ] Learn workflow patterns
- [ ] Suggest CLI combos based on history
- [ ] Auto-generate workflow chains
- [ ] Performance metrics per CLI
- [ ] User custom CLI suggestions

---

**Active in all Claude sessions.** Keyword detection runs automatically. Disable with `stop cli-suggester` or `normal mode`.
