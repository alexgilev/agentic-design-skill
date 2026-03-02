#!/bin/bash
# Agentic Design Audit Script
# Scans code for common design violations against system.md
#
# Usage: bash scripts/audit.sh <target-path> [system-md-path]
#
# Checks:
#   - Random spacing values (not on grid)
#   - Mixed depth strategies (shadows + heavy borders)
#   - Missing interaction states
#   - Inconsistent radius values
#   - Hardcoded colors (not using tokens)
#   - Multiple accent colors

set -e

TARGET="${1:-.}"
SYSTEM_MD="${2:-.agentic-design/system.md}"
VIOLATIONS=0

RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m'

echo "═══════════════════════════════════════════"
echo "  Agentic Design Audit"
echo "  Target: $TARGET"
echo "═══════════════════════════════════════════"
echo ""

# ─── Check system.md exists ───
if [ ! -f "$SYSTEM_MD" ]; then
  echo -e "${YELLOW}WARNING: No system.md found at $SYSTEM_MD${NC}"
  echo "Run /agentic-design:init to create one."
  echo "Auditing against embedded baseline rules only."
  echo ""
fi

# ─── 1. Random spacing values ───
echo "▸ Checking spacing values..."
RANDOM_SPACING=$(grep -rn --include="*.css" --include="*.tsx" --include="*.jsx" --include="*.scss" \
  -E "(padding|margin|gap):\s*[0-9]+(px|rem)" "$TARGET" 2>/dev/null | \
  grep -vE "(0|4|8|12|16|20|24|32|40|48|64|80|96)px" | \
  grep -vE "(0|0\.25|0\.5|0\.75|1|1\.5|2|3|4|6|8)rem" || true)

if [ -n "$RANDOM_SPACING" ]; then
  echo -e "${RED}  FAIL: Non-grid spacing values found:${NC}"
  echo "$RANDOM_SPACING" | head -10
  VIOLATIONS=$((VIOLATIONS + $(echo "$RANDOM_SPACING" | wc -l)))
else
  echo -e "${GREEN}  PASS: All spacing values on grid${NC}"
fi
echo ""

# ─── 2. Mixed depth strategies ───
echo "▸ Checking depth consistency..."
HAS_SHADOWS=$(grep -rl --include="*.css" --include="*.tsx" --include="*.jsx" --include="*.scss" \
  "box-shadow" "$TARGET" 2>/dev/null | wc -l)
HAS_HEAVY_BORDERS=$(grep -rn --include="*.css" --include="*.tsx" --include="*.jsx" --include="*.scss" \
  -E "border:\s*(2|3|4|5)px\s+solid" "$TARGET" 2>/dev/null | wc -l)

if [ "$HAS_SHADOWS" -gt 0 ] && [ "$HAS_HEAVY_BORDERS" -gt 0 ]; then
  echo -e "${RED}  FAIL: Mixed depth — shadows ($HAS_SHADOWS files) AND heavy borders ($HAS_HEAVY_BORDERS instances)${NC}"
  VIOLATIONS=$((VIOLATIONS + 1))
else
  echo -e "${GREEN}  PASS: Consistent depth strategy${NC}"
fi
echo ""

# ─── 3. Hardcoded colors ───
echo "▸ Checking for hardcoded colors..."
HARDCODED=$(grep -rn --include="*.css" --include="*.tsx" --include="*.jsx" --include="*.scss" \
  -E "(color|background|border-color):\s*#[0-9a-fA-F]{3,8}" "$TARGET" 2>/dev/null | \
  grep -v "var(--" | grep -v "//" | grep -v "/*" || true)

if [ -n "$HARDCODED" ]; then
  COUNT=$(echo "$HARDCODED" | wc -l)
  echo -e "${YELLOW}  WARN: $COUNT hardcoded color values (should use tokens):${NC}"
  echo "$HARDCODED" | head -10
  VIOLATIONS=$((VIOLATIONS + COUNT))
else
  echo -e "${GREEN}  PASS: All colors use tokens${NC}"
fi
echo ""

# ─── 4. Missing hover states ───
echo "▸ Checking interaction states..."
BUTTONS=$(grep -rl --include="*.tsx" --include="*.jsx" \
  -E "<button|<Button|role=\"button\"" "$TARGET" 2>/dev/null || true)

if [ -n "$BUTTONS" ]; then
  MISSING_HOVER=0
  while IFS= read -r file; do
    if ! grep -q ":hover\|onMouseEnter\|hover:" "$file" 2>/dev/null; then
      echo -e "${YELLOW}  WARN: $file has buttons but no hover states${NC}"
      MISSING_HOVER=$((MISSING_HOVER + 1))
    fi
  done <<< "$BUTTONS"
  if [ "$MISSING_HOVER" -eq 0 ]; then
    echo -e "${GREEN}  PASS: Hover states found in button files${NC}"
  else
    VIOLATIONS=$((VIOLATIONS + MISSING_HOVER))
  fi
else
  echo -e "${GREEN}  PASS: No button files to check${NC}"
fi
echo ""

# ─── 5. Inconsistent border-radius ───
echo "▸ Checking border-radius consistency..."
RADIUS_VALUES=$(grep -roh --include="*.css" --include="*.tsx" --include="*.jsx" --include="*.scss" \
  -E "border-radius:\s*[0-9]+(px|rem)" "$TARGET" 2>/dev/null | \
  sed 's/border-radius:\s*//' | sort -u || true)
RADIUS_COUNT=$(echo "$RADIUS_VALUES" | grep -c "." 2>/dev/null || echo 0)

if [ "$RADIUS_COUNT" -gt 4 ]; then
  echo -e "${RED}  FAIL: $RADIUS_COUNT unique radius values (should be ≤3 scale values):${NC}"
  echo "$RADIUS_VALUES"
  VIOLATIONS=$((VIOLATIONS + 1))
else
  echo -e "${GREEN}  PASS: $RADIUS_COUNT radius values (within scale)${NC}"
fi
echo ""

# ─── Summary ───
echo "═══════════════════════════════════════════"
if [ "$VIOLATIONS" -eq 0 ]; then
  echo -e "${GREEN}  ✓ PASS — No violations found${NC}"
else
  echo -e "${RED}  ✗ $VIOLATIONS violation(s) found${NC}"
fi
echo "═══════════════════════════════════════════"

exit $VIOLATIONS
