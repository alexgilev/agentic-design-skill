# Design System — Sophistication & Trust

## Direction
Personality: Sophistication & Trust
Foundation: neutral (zinc)
Depth: layered-shadows
Signature: Weighted horizontal rules with serif accent typography — section dividers use a distinctive weight progression (hairline → thin → medium) and key headings use a serif typeface at specific breakpoints, creating a sense of editorial authority.

## Domain
Private banking foyer, leather portfolio, embossed letterhead, architectural blueprint, museum catalog, notary seal, fountain pen stroke

## Color World
Ink black (#18181B), parchment cream (#FAFAF9), gold foil (#B45309), deep navy (#1E3A5F), graphite (#3F3F46), ivory (#FFFFF0)

## Tokens

### Spacing
Base: 4px
Scale: 8, 16, 24, 32, 48, 64, 96 (wide scale for breathing room)

### Colors
```
--foreground:  #18181B  (zinc-900)
--secondary:   #52525B  (zinc-600)
--muted:       #A1A1AA  (zinc-400)
--faint:       #E4E4E7  (zinc-200)
--accent:      #1E3A5F  (deep navy)
--surface:     #FFFFFF
--background:  #FAFAFA  (zinc-50)
--shadow:      0 1px 3px rgba(0,0,0,0.04), 0 4px 12px rgba(0,0,0,0.03)
```

### Radius
Scale: 4px, 6px, 8px (restrained, confident)

### Typography
Font: Inter (UI) + serif accent (headings, large numbers)
Scale: 12, 13, 14 (base), 16, 20, 28, 40
Weights: 400, 500, 600
Line-height: 1.6 (body) / 1.15 (headings)
Letter-spacing: -0.01em (headings), 0.01em (labels)

## Patterns

### Button Primary
Height: 40px
Padding: 12px 24px
Radius: 6px
Font: 14px, 500 weight
Background: var(--accent)

### Card Default
Border: 0.5px solid var(--faint)
Padding: 24px
Radius: 8px
Background: var(--surface)
Shadow: var(--shadow)

### Input Default
Height: 42px
Padding: 12px 16px
Radius: 4px
Border: 1px solid var(--faint)

### Navigation
Height: 56px
Sidebar width: 240px
Context indicator: subtle background fill + left accent line

## Decisions

| Decision | Rationale | Agentic Principle | Date |
|----------|-----------|----------------|------|
| Layered shadows | Premium elevation without heaviness | Agentic: Depth Strategy Selection | 2026-03-01 |
| Serif accent type | Editorial authority signals trustworthiness | Agentic: Typography Trust Signals | 2026-03-01 |
| Wide spacing scale | Breathing room signals confidence and quality | Agentic: Spacing as Brand Signal | 2026-03-01 |
| Deep navy accent | Conservative but distinctive; avoids generic blue | Agentic: Color for Financial Products | 2026-03-01 |

## Rejected Defaults

| Default | Replacement | Why |
|---------|-------------|-----|
| Blue-500 accent | Deep navy #1E3A5F | Generic blue feels SaaS; navy feels institutional |
| Sans-only typography | Serif accents on key headings | Serif signals authority and permanence |
| 12px radius cards | 8px restrained radius | Smaller radius = more serious, confident |
