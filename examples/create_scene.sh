#!/bin/bash
# Blender scene creation for product showcase

echo "Creating product showcase scene..."

# Create new scene with product profile
cli-anything-blender scene new --profile="product-showcase"

# Add main product object (cube as placeholder)
cli-anything-blender object add --type=cube \
  --location="0,0,0" \
  --scale="2,2,2"

# Create realistic material
cli-anything-blender material create --name="product-material" \
  --color="#1a1a2e" \
  --metallic=0.6 \
  --roughness=0.3

# Assign material to object
cli-anything-blender material assign --object=0 --material="product-material"

# Add three-point lighting setup
cli-anything-blender light add --type=sun \
  --location="5,5,5" \
  --energy=2.0 \
  --rotation="45,45,0"

cli-anything-blender light add --type=area \
  --location="-5,3,4" \
  --energy=1.5

cli-anything-blender light add --type=spot \
  --location="3,-5,3" \
  --energy=1.2 \
  --rotation="0,0,45"

# Position camera for optimal framing
cli-anything-blender camera set \
  --location="4,4,3" \
  --look-at="0,0,0" \
  --fov=50

# Configure render settings
cli-anything-blender render settings \
  --engine="cycles" \
  --samples=256 \
  --resolution="1920x1080"

# Save project state
cli-anything-blender scene save --filename="product_scene.blend"

echo "✓ Scene created: product_scene.blend"
