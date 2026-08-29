# Assessos MVP Stack Deployment

**Date:** 2026-08-29  
**Status:** ✓ Installed & Ready  

## Installed CLIs (7 Total)

### Core Assessos Stack (5)
- ✓ **n8n** — Workflow automation for candidate scoring pipelines
- ✓ **ChromaDB** — Vector embeddings for semantic candidate search
- ✓ **OpenRefine** — Data cleaning & normalization of candidate profiles
- ✓ **Obsidian** — Knowledge base for scoring rubrics & case studies
- ✓ **Mermaid** — Architecture diagrams & scoring algorithm visualization

### Existing CLIs (2)
- ✓ **Blender** — 3D product visualization (existing)
- ✓ **ComfyUI** — AI image generation (existing)

---

## Phase 1: Data Cleanup (Week 1)

**Goal:** Normalize candidate database, fix duplicates, standardize fields

```bash
# Import and clean raw candidate data
cli-anything-openrefine import --file=candidates.csv
cli-anything-openrefine operation add --operation="remove-duplicates"
cli-anything-openrefine operation add --operation="normalize-fields"

# Document cleanup results
cli-anything-obsidian vault create \
  --path="Data/Cleanup-Log" \
  --title="Candidate Data Cleanup - Phase 1" \
  --content="# Data Cleanup Results\n\n- Records processed: X\n- Duplicates removed: Y\n- Fields normalized: Z"
```

---

## Phase 2: Semantic Search (Week 2)

**Goal:** Enable semantic candidate search via embeddings

```bash
# Create ChromaDB collection
cli-anything-chromadb create-collection --name="assessos_candidates"

# Add candidate profiles as embeddings
cli-anything-chromadb add --collection="assessos_candidates" \
  --documents="candidate_profiles.json" \
  --metadata="skills,experience,role"

# Query similar candidates
cli-anything-chromadb query \
  --collection="assessos_candidates" \
  --query="experienced DevOps engineers with Python backend" \
  --limit=10
```

---

## Phase 3: Workflow Automation (Week 3)

**Goal:** Automate candidate scoring on assessment submission

```bash
# Create n8n workflow
cli-anything-n8n workflow create --name="assessment-auto-scoring"

# Workflow steps:
# 1. Trigger: New assessment submission
# 2. Action: Extract candidate responses
# 3. Action: Run scoring logic
# 4. Action: Log results to Obsidian
# 5. Action: Update candidate profile in ChromaDB

# Example: cli-anything-n8n workflow execute --workflow="assessment-auto-scoring"
```

---

## Phase 4: Documentation (Week 4)

**Goal:** Document architecture, scoring algorithms, data flows

```bash
# Create architecture diagram
cat > scoring-algorithm.mmd << 'EOF'
graph TD
  A[Assessment Submitted] --> B[Extract Responses]
  B --> C[OpenRefine: Normalize]
  C --> D[Scoring Algorithm]
  D --> E[ChromaDB: Store Embeddings]
  E --> F[Obsidian: Log Results]
  F --> G[Dashboard Update]
EOF

# Render diagram
cli-anything-mermaid export render scoring-algorithm.mmd --format=svg

# Store in knowledge base
cli-anything-obsidian vault create \
  --path="Docs/Architecture/Scoring-System" \
  --title="Candidate Scoring Architecture" \
  --content="[Diagram content here]"
```

---

## Integration Points

### NestJS Backend → n8n
- Webhook trigger on new assessment
- POST results to n8n
- Receive scoring response

### React Frontend
- Query ChromaDB for semantic search
- Display assessment results from n8n
- Show Obsidian documentation links

### Python ML Backend (leadership-ai)
- Send candidate data to ChromaDB
- Use embeddings for model input
- Log predictions to Obsidian

---

## Quick Start Commands

```bash
# List installed CLIs
cli-hub list | grep "●"

# Get CLI help
cli-hub help n8n
cli-hub help chromadb
cli-hub help openrefine

# Start Obsidian vault
cli-anything-obsidian vault open

# Test n8n
cli-anything-n8n health

# Test ChromaDB
cli-anything-chromadb list-collections
```

---

## Success Criteria

✓ **Phase 1:** Candidate data cleaned & normalized (0 duplicates)  
✓ **Phase 2:** 1000+ candidate profiles as embeddings, semantic search working  
✓ **Phase 3:** Auto-scoring workflow processes 100% of submissions  
✓ **Phase 4:** Architecture documented, rubrics in Obsidian  

---

## Next: Implementation

1. Start Phase 1 (data cleanup)
2. Connect NestJS to n8n webhooks
3. Build ChromaDB integration in React
4. Add Obsidian logging to scoring pipeline
5. Test end-to-end

**Owner:** Assessos Team  
**Timeline:** 4 weeks  
**Status:** Ready to start
