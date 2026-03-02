# Design System — Warmth & Approachability

## Direction
Personality: Warmth & Approachability
Foundation: warm (stone)
Depth: subtle-shadows
Signature: Rounded progress indicators with gentle pulsing animations — every status and progress element uses soft pill shapes with warm gradient fills that breathe subtly, creating a sense of life and forward motion.

## Domain
Garden path, morning light, handwritten note, kitchen table, warm blanket, soft focus photograph, watercolor edge

## Color World
Morning gold (#F59E0B), terracotta clay (#C2410C), sage green (#65A30D), linen cream (#FAFAF9), warm charcoal (#44403C), blush rose (#FB7185)

## Tokens

### Spacing
Base: 4px
Scale: 8, 12, 16, 24, 32, 48 (generous)

### Colors
```
--foreground:  #1C1917  (stone-900)
--secondary:   #57534E  (stone-600)
--muted:       #A8A29E  (stone-400)
--faint:       #E7E5E4  (stone-200)
--accent:      #EA580C  (orange-600)
--surface:     #FFFFFF
--background:  #FAFAF9  (stone-50)
--shadow:      0 1px 3px rgba(0, 0, 0, 0.06), 0 1px 2px rgba(0, 0, 0, 0.04)
```

### Radius
Scale: 8px, 12px, 16px (soft, friendly)

### Typography
Font: Inter
Scale: 13, 14, 15, 16 (base), 18, 22, 30
Weights: 400, 500, 600
Line-height: 1.6 (body) / 1.25 (headings)

## Patterns

### Button Primary
Height: 42px
Padding: 12px 24px
Radius: 10px
Font: 15px, 500 weight
Background: var(--accent)
Shadow: 0 1px 2px rgba(0, 0, 0, 0.06)

### Card Default
Border: none
Padding: 20px
Radius: 12px
Background: var(--surface)
Shadow: var(--shadow)

### Input Default
Height: 44px
Padding: 12px 16px
Radius: 8px
Border: 1.5px solid var(--faint)

### Navigation
Height: 60px
Sidebar width: 260px
Context indicator: filled pill background with accent tint

## Decisions

| Decision | Rationale | Agentic Principle | Date |
|----------|-----------|----------------|------|
| Subtle shadows | Soft depth creates comfort without visual weight | Agentic: Depth Strategy Selection | 2026-03-01 |
| Generous spacing | Consumer product — breathing room reduces cognitive load | Agentic: Spacing for Consumer Products | 2026-03-01 |
| Warm stone palette | Human, inviting — avoids clinical blue/gray | Agentic: Color Temperature | 2026-03-01 |
| 42px buttons | Comfortable touch targets, generous feel | Agentic: Control Sizing | 2026-03-01 |

## Rejected Defaults

| Default | Replacement | Why |
|---------|-------------|-----|
| Slate gray palette | Stone warm palette | Warm personality requires warm foundation |
| Border-based cards | Shadow-based cards | Borders feel rigid; shadows feel lifted and soft |
| System font stack | Inter | Geometric warmth, excellent readability at all sizes |
