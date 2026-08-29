# CLI Activation Guide

Activate automatic CLI suggestions across all Claude sessions.

## Option 1: Claude Code Plugin (Recommended)

### Install Plugin
```bash
# Method A: Using Claude Code CLI
claude plugin install cli-anything

# Method B: Using GitHub URL
claude plugin install https://github.com/medussabjorn-collab/cli-anything-claude-plugin

# Method C: Manual installation
# 1. Go to Claude Code → Settings → Plugins
# 2. Click "Add Plugin"
# 3. Paste: https://github.com/medussabjorn-collab/cli-anything-claude-plugin
# 4. Click Install
```

### Verify Installation
```bash
# Check if plugin is active
claude plugins list | grep cli-anything

# Test: Ask Claude about a 3D task
# Claude should automatically suggest Blender + recommend installation
```

### Enable CLI Suggester Skill
The skill auto-activates when keywords are detected.

To force activation:
```
Tell Claude: "Use the cli-suggester skill"
```

To deactivate:
```
Tell Claude: "stop cli-suggester" or "normal mode"
```

## Option 2: Manual Skill Activation

### Add Skill to Claude Code Settings
```bash
# Location of Claude Code settings
~/.claude/settings.json

# Add to skills array:
{
  "skills": [
    {
      "name": "cli-suggester",
      "path": "/path/to/cli-anything-claude-plugin/skills/cli-suggester.md"
    }
  ]
}
```

### Or: Use Skill Command
```bash
# In Claude Code chat:
/cli-suggester

# This loads and activates the skill for the current session
```

## Option 3: Global Hook Activation

### Create Claude Code Hook (Linux/Mac)
```bash
# Create hooks directory
mkdir -p ~/.claude/hooks

# Create session start hook
cat > ~/.claude/hooks/cli-initialize.js << 'EOF'
#!/usr/bin/env node

// CLI Suggestion System - Session Start Hook
// Auto-loads CLI recommendation context

const fs = require('fs');
const path = require('path');

// CLI registry with triggers
const CLI_REGISTRY = {
  keywords: {
    '3D': ['blender', '3mf', 'cloudcompare'],
    'AI': ['comfyui', 'ollama', 'exa'],
    'automate': ['n8n'],
    'workflow': ['n8n', 'mermaid', 'obsidian'],
    'data': ['openrefine', 'chromadb'],
    'document': ['obsidian', 'mermaid'],
    'notes': ['obsidian', 'joplin'],
    'video': ['kdenlive', 'shotcut'],
    'music': ['musescore'],
    'brainstorm': ['mubu', 'obsidian'],
    'debug': ['lldb', 'renderdoc'],
    'knowledge': ['obsidian', 'siyuan'],
    'search': ['exa', 'browser'],
    'local-llm': ['ollama', 'chromadb']
  },
  chains: {
    '3D_to_AI': ['blender', 'comfyui', 'mermaid', 'obsidian'],
    'automate': ['n8n', 'obsidian'],
    'creative': ['blender', 'comfyui', 'kdenlive', 'obsidian'],
    'data': ['openrefine', 'chromadb', 'obsidian'],
    'ai_pipeline': ['ollama', 'chromadb', 'obsidian']
  }
};

// Send context to Claude
const systemMessage = `
## CLI Suggestion System Active

I have access to 50+ CLIs organized for common tasks. When you mention:
- **3D work**: I'll suggest Blender (+ 3MF, CloudCompare for support)
- **AI images**: I'll suggest ComfyUI (+ Obsidian for storage)
- **Automation**: I'll suggest n8n (+ Obsidian + Mermaid for docs)
- **Data work**: I'll suggest OpenRefine (+ ChromaDB)
- **Documentation**: I'll suggest Obsidian (+ Mermaid for diagrams)
- **Video editing**: I'll suggest Kdenlive (+ Shotcut)
- **Brainstorming**: I'll suggest Mubu (+ Obsidian)
- **Local LLM**: I'll suggest Ollama (+ ChromaDB)

I can also suggest full workflow chains like:
  Blender → ComfyUI → n8n → Mermaid → Obsidian

For any suggestion, I'll provide:
1. Why this CLI is best
2. Installation command: \`cli-hub install [name]\`
3. Quick start example
4. Related CLIs to chain together

Type: "help me [task]" to get started.
Type: "list all CLIs" to see all 50+ options.
Type: "what CLIs can do [thing]?" for discovery.
`;

console.log(systemMessage);
EOF

chmod +x ~/.claude/hooks/cli-initialize.js
```

### Create Claude Code Hook (Windows PowerShell)
```powershell
# Create hooks directory
$hooksDir = "$env:APPDATA\Claude\hooks"
New-Item -ItemType Directory -Path $hooksDir -Force | Out-Null

# Create initialization script
$initScript = @'
# CLI Suggestion System - Session Start Hook

$CLIRegistry = @{
    Keywords = @{
        '3D' = @('blender', '3mf', 'cloudcompare')
        'AI' = @('comfyui', 'ollama', 'exa')
        'automate' = @('n8n')
        'workflow' = @('n8n', 'mermaid', 'obsidian')
        'data' = @('openrefine', 'chromadb')
        'document' = @('obsidian', 'mermaid')
    }
}

$message = @"
== CLI Suggestion System Active ==

Available CLIs for your tasks:
- 3D/CAD: Blender, 3MF, CloudCompare
- AI: ComfyUI, Ollama, Exa
- Automation: n8n
- Data: OpenRefine, ChromaDB
- Docs: Obsidian, Mermaid
- Video: Kdenlive, Shotcut
- Music: MuseScore
- Plus 35+ more

Ask me: "help me [task]" or "list all CLIs"
"@

Write-Host $message
'@

Set-Content -Path "$hooksDir\cli-initialize.ps1" -Value $initScript
```

## Option 4: Per-Session Activation

### Automatic (Just Start Asking)
```
User: "I need to create a 3D product render"
Claude: "3D task detected. Suggesting Blender + Mermaid.
         Install: cli-hub install blender
         Quick start: blender scene new ..."
```

### Manual (Type Command)
In Claude Code chat:
```
/cli-suggester
```

Then ask your task and Claude will suggest relevant CLIs.

## Verification

### Verify CLI Suggestion System is Active
```bash
# Ask Claude a task
# Expected: Claude should suggest relevant CLIs

# Example test:
"I want to generate AI images of products"

# Expected response:
"ComfyUI detected. Install: cli-hub install comfyui"
```

### Test Installation
```bash
# Install one CLI
cli-hub install mermaid

# Use it
echo 'graph TD
  A[Start] --> B[Process]
  B --> C[End]' > diagram.mmd
  
cli-anything-mermaid export render diagram.svg
```

## Troubleshooting

### Claude Not Suggesting CLIs
**Issue**: Suggestions stopped working
**Fix**:
1. Tell Claude: "activate cli-suggester"
2. Ask about a task (e.g., "create a diagram")
3. Claude should suggest Mermaid

### Installation Fails
**Issue**: `cli-hub install blender` returns error
**Fix**:
1. Check CLI-Anything is installed: `cli-hub list`
2. Check internet connection
3. Try again: `cli-hub install blender --verbose`

### Hook Not Executing
**Issue**: Hook file not running at session start
**Fix**:
1. Verify hook location: `~/.claude/hooks/`
2. Check file permissions: `chmod +x ~/.claude/hooks/cli-*.js`
3. Restart Claude Code

### Permission Denied
**Issue**: "Permission denied" when installing CLI
**Fix**:
```bash
# Make CLI-hub executable
chmod +x $(which cli-hub)

# Or reinstall
npm install -g @cli-anything/hub
```

## Configuration Files

### CLI Suggester Config
```json
// ~/.claude/cli-suggester.json
{
  "enabled": true,
  "autoSuggest": true,
  "autoInstall": false,
  "keywordThreshold": 0.7,
  "maxSuggestions": 3,
  "showWorkflows": true,
  "cavemenMode": true,
  "trackUsage": true
}
```

### Claude Code Plugin Settings
```json
// ~/.claude/settings.json
{
  "plugins": {
    "cli-anything": {
      "enabled": true,
      "autoLoad": true,
      "settings": {
        "installDir": "/path/to/cli-anything"
      }
    }
  }
}
```

## Next Steps

1. **Install plugin**: `claude plugin install cli-anything`
2. **Test activation**: Ask Claude "I want to create a diagram"
3. **Install a CLI**: `cli-hub install mermaid`
4. **Try a workflow**: `bash examples/run-complete-workflow.sh`
5. **Explore CLIs**: `cli-hub list`

## Support & Feedback

- **Plugin**: https://github.com/medussabjorn-collab/cli-anything-claude-plugin
- **CLI-Anything**: https://github.com/HKUDS/CLI-Anything
- **Issues**: Report at GitHub Issues
- **Discord**: Join our community

---

**Ready?** Start Claude Code and ask: "I need to create a 3D model"
Claude will suggest Blender and walk you through setup.
