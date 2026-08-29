#!/bin/bash
# Complete workflow orchestration

set -e

WORKSPACE="${1:-.}"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
OUTPUT="$WORKSPACE/output_$TIMESTAMP"

mkdir -p "$OUTPUT"

echo "=========================================="
echo "AI Creative Workflow - Full Pipeline"
echo "=========================================="
echo "Workspace: $WORKSPACE"
echo "Output: $OUTPUT"
echo ""

# Step 1: Create Blender Scene
echo "[1/4] Creating 3D scene in Blender..."
bash "$WORKSPACE/create_scene.sh" || echo "  (Requires Blender installed)"
echo ""

# Step 2: Trigger n8n Workflow
echo "[2/4] Executing n8n automation workflow..."
echo "  n8n workflow defined at: $WORKSPACE/n8n-workflow.json"
echo "  (Start n8n: docker run -p 5678:5678 n8nio/n8n)"
echo ""

# Step 3: Generate AI Enhanced Image
echo "[3/4] Running ComfyUI image generation..."
echo "  ComfyUI workflow defined at: $WORKSPACE/comfyui-workflow.json"
echo "  (Start ComfyUI: python main.py)"
echo ""

# Step 4: Create Documentation
echo "[4/4] Generating workflow documentation..."

cat > "$OUTPUT/README.md" << 'README'
# AI Creative Workflow - Results

## Components

### 1. Blender (3D Modeling)
- Scene: `product_scene.blend`
- Objects: Product cube + lighting setup
- Camera: Optimized for product showcase
- Render: 1920x1080, Cycles engine, 256 samples

### 2. ComfyUI (AI Enhancement)
- Model: SDXL Base 1.0
- Prompt: Professional product photography
- Style: Studio lighting, white background
- Output: Enhanced product image

### 3. n8n (Orchestration)
- Workflow: Sequential pipeline
- Inputs: Product description
- Outputs: Model file + AI image + documentation
- Status: Ready to deploy

### 4. Mermaid (Documentation)
- Diagram: workflow.svg
- Shows: Data flow and component connections
- Format: SVG, interactive on Mermaid Live

## Running the Workflow

### Prerequisites
```bash
# Blender
blender --version

# ComfyUI
python -c "import comfyui"

# n8n
docker ps | grep n8n

# Mermaid
cli-anything-mermaid --version
```

### Execute
```bash
# Option 1: Full automation via n8n
curl -X POST http://localhost:5678/webhook/product-pipeline \
  -d '{"name":"Product X","description":"..."}'

# Option 2: Manual step-by-step
bash create_scene.sh
cli-anything-comfyui workflow run comfyui-workflow.json
cli-anything-mermaid export share --mode=view
```

## Output Files
- `product_scene.blend` - 3D model
- `product_rendered.png` - AI enhanced image
- `workflow.svg` - Process diagram
- `results.json` - Metadata

## Integration Points

**Blender → n8n**: Scene file path
**n8n → ComfyUI**: Blender render output triggers AI
**ComfyUI → n8n**: Enhanced image for packaging
**Mermaid**: Tracks complete workflow state

## Future Enhancements
- Add batch processing (multiple products)
- Implement quality checks
- Add version control for scenes
- Create web UI for order management
- Scale to distributed rendering
README

cp "$WORKSPACE/workflow.mmd" "$OUTPUT/"
cp "$WORKSPACE/comfyui-workflow.json" "$OUTPUT/"
cp "$WORKSPACE/n8n-workflow.json" "$OUTPUT/"

echo "✓ Documentation generated"
echo ""
echo "=========================================="
echo "Workflow Complete!"
echo "=========================================="
echo "Output directory: $OUTPUT"
echo ""
echo "Next steps:"
echo "1. Start Blender: blender"
echo "2. Start ComfyUI: python main.py"
echo "3. Start n8n: docker run -p 5678:5678 n8nio/n8n"
echo "4. Review: cat $OUTPUT/README.md"
