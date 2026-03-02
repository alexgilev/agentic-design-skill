# Design System — Precision & Density

## Direction
Personality: Precision & Density
Foundation: cool (slate)
Depth: borders-only
Signature: Micro-grid alignment indicators — every component snaps to a visible 4px grid in dev mode, and spacing between elements follows a strict mathematical rhythm that creates a sense of engineered precision.

## Domain
Command center, control panel, radar screen, instrument cluster, flight deck, wire-frame blueprint, circuit board trace lines

## Color World
Slate console gray (#64748B), indicator green (#22C55E), alert amber (#F59E0B), steel blue (#3B82F6), deep charcoal (#1E293B), trace silver (#CBD5E1)

## Tokens

### Spacing
Base: 4px
Scale: 4, 8, 12, 16, 24, 32, 48

### Colors
```
--foreground:  #0F172A  (slate-900)
--secondary:   #475569  (slate-600)
--muted:       #94A3B8  (slate-400)
--faint:       #E2E8F0  (slate-200)
--accent:      #3B82F6  (blue-500)
--surface:     #FFFFFF
--background:  #F8FAFC  (slate-50)
--shadow:      none
```

### Radius
Scale: 3px, 5px, 7px (sharp, technical)

### Typography
Font: Geist (monospace variant for data, sans for UI)
Scale: 11, 12, 13, 14 (base), 16, 20, 28
Weights: 400, 500, 600
Line-height: 1.5 (body) / 1.2 (headings)

## Patterns

### Button Primary
Height: 32px
Padding: 8px 12px
Radius: 3px
Font: 13px, 500 weight
Background: var(--accent)

### Card Default
Border: 0.5px solid var(--faint)
Padding: 12px
Radius: 5px
Background: var(--surface)
Shadow: none

### Input Default
Height: 32px
Padding: 6px 10px
Radius: 3px
Border: 1px solid var(--faint)

### Navigation
Height: 48px
Sidebar width: 220px
Context indicator: 2px left border accent highlight

## Decisions

| Decision | Rationale | Agentic Principle | Date |
|----------|-----------|----------------|------|
| Borders-only depth | Dashboard tool — shadows waste space and add no information | Agentic: Depth Strategy Selection | 2026-03-01 |
| 4px spacing base | Data tables need tight control; 8px too coarse for dense layouts | Agentic: Spacing System Fundamentals | 2026-03-01 |
| 32px button height | Compact controls for information-dense screens | Agentic: Control Sizing | 2026-03-01 |
| Geist font | Monospace data alignment + clean UI weight in sans variant | Agentic: Typography Pairing | 2026-03-01 |

## Rejected Defaults

| Default | Replacement | Why |
|---------|-------------|-----|
| 8px radius cards | 5px sharp cards | Precision personality — rounded feels casual |
| Inter font | Geist | Monospace data variant needed for tabular alignment |
| Shadow-based depth | Border-based depth | Shadows soften edges; borders maintain crispness |
