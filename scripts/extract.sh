#!/bin/bash
# Agentic Design Pattern Extractor
# Scans existing code and extracts recurring design values
#
# Usage: bash scripts/extract.sh <target-path>
#
# Outputs a summary of detected patterns that can be used
# to populate system.md

set -e

TARGET="${1:-.}"

echo "═══════════════════════════════════════════"
echo "  Agentic Design Pattern Extractor"
echo "  Target: $TARGET"
echo "═══════════════════════════════════════════"
echo ""

# ─── Spacing values ───
echo "▸ Spacing values found:"
grep -roh --include="*.css" --include="*.tsx" --include="*.jsx" --include="*.scss" \
  -E "(padding|margin|gap):\s*[0-9]+(px|rem)" "$TARGET" 2>/dev/null | \
  sed 's/(padding|margin|gap):\s*//' | sort | uniq -c | sort -rn | head -15 || echo "  (none)"
echo ""

# ─── Colors ───
echo "▸ Colors used:"
grep -roh --include="*.css" --include="*.tsx" --include="*.jsx" --include="*.scss" \
  -E "#[0-9a-fA-F]{3,8}" "$TARGET" 2>/dev/null | \
  tr '[:upper:]' '[:lower:]' | sort | uniq -c | sort -rn | head -15 || echo "  (none)"
echo ""

# ─── Border radius ───
echo "▸ Border radius values:"
grep -roh --include="*.css" --include="*.tsx" --include="*.jsx" --include="*.scss" \
  -E "border-radius:\s*[0-9]+(px|rem)" "$TARGET" 2>/dev/null | \
  sed 's/border-radius:\s*//' | sort | uniq -c | sort -rn || echo "  (none)"
echo ""

# ─── Font sizes ───
echo "▸ Font sizes:"
grep -roh --include="*.css" --include="*.tsx" --include="*.jsx" --include="*.scss" \
  -E "font-size:\s*[0-9]+(px|rem)" "$TARGET" 2>/dev/null | \
  sed 's/font-size:\s*//' | sort | uniq -c | sort -rn || echo "  (none)"
echo ""

# ─── Font families ───
echo "▸ Fonts used:"
grep -roh --include="*.css" --include="*.tsx" --include="*.jsx" --include="*.scss" \
  -E "font-family:\s*[^;]+" "$TARGET" 2>/dev/null | \
  sed 's/font-family:\s*//' | sort | uniq -c | sort -rn || echo "  (none)"
echo ""

# ─── Box shadows ───
echo "▸ Shadow definitions:"
grep -roh --include="*.css" --include="*.tsx" --include="*.jsx" --include="*.scss" \
  -E "box-shadow:\s*[^;]+" "$TARGET" 2>/dev/null | \
  sed 's/box-shadow:\s*//' | sort | uniq -c | sort -rn | head -10 || echo "  (none)"
echo ""

# ─── CSS custom properties ───
echo "▸ CSS custom properties (tokens):"
grep -roh --include="*.css" --include="*.tsx" --include="*.jsx" --include="*.scss" \
  -E "--[a-zA-Z0-9-]+:\s*[^;]+" "$TARGET" 2>/dev/null | \
  sort | uniq -c | sort -rn | head -20 || echo "  (none)"
echo ""

# ─── Tailwind classes (if used) ───
echo "▸ Tailwind spacing classes:"
grep -roh --include="*.tsx" --include="*.jsx" --include="*.html" \
  -E "(p|m|gap|space)-[a-z]?-?[0-9]+" "$TARGET" 2>/dev/null | \
  sort | uniq -c | sort -rn | head -15 || echo "  (none)"
echo ""

echo "═══════════════════════════════════════════"
echo "  Use these patterns to populate system.md"
echo "═══════════════════════════════════════════"
