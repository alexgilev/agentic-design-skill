# Notion Knowledge Base — Actual Schema

Database: **Product Design Best Practices (RAG)**
Data source: `collection://b27fc956-ab1c-4d1a-a377-b88ef3c4526a`
Entries: UX-001 through UX-356

## Properties

| Property | Type | Description |
|----------|------|-------------|
| Best Practice | Title | Principle name |
| ID | Text | Unique identifier (UX-001 format) |
| Category | Select (26 options) | Primary domain |
| Subcategory | Text | Narrower topic within category |
| Tags | Multi-select (36 options) | Cross-cutting concerns |
| Practicality Score | Number (1-5, ring display) | 5=must-have, 4=very important, 3=situational, 2=niche, 1=theoretical |
| Context | Text | When to apply this practice |
| Sources | Text | Source citations with URLs |

## Categories (26)

Accessibility, Behavioral Psychology, Cognitive Load, Cognitive Psychology,
Component Patterns, Dashboard Design, Data Display & Tables,
Design Process & Methodology, Design Systems & Tokens, Desktop-Specific Patterns,
Enterprise & B2B Patterns, Feedback & Error Handling, Forms & Input,
Gamification, Gestalt Principles, Human-Centered Design, Interaction Patterns,
Layout & Visual Hierarchy, Loading & Performance Perception,
Navigation & Information Architecture, Onboarding & Empty States,
Product Strategy, Reading Psychology, Search Filter & Sort,
Usability Heuristics, Workflow & Multi-Step Processes

## Tags (36)

accessibility, ai-patterns, animation, behavioral-psychology, cognitive-bias,
cognitive-load, content-design, conversion, dashboard, data-heavy, decision-making,
defaults, design-system, desktop, engagement, enterprise, error-handling, forms,
gamification, gestalt-principles, human-centered-design, keyboard, mobile,
navigation, onboarding, performance, persuasion, reading-psychology, responsive,
retention, search, social-proof, tables, trust, typography, workflow

## Views

- **Cards** — Board view grouped by Category
- **List** — Table view sorted by Practicality Score (descending)

## Querying Patterns

The skill searches this database using `notion-search` with `data_source_url`:

- Task-specific: "dashboard layout", "form design", "table patterns"
- Category-level: "spacing system", "typography", "color theory"
- Tag-level: "accessibility", "enterprise", "cognitive-load"
- Audit: "[category] anti-patterns", "[category] violations"
- Broad: "best practices for [product type]"
