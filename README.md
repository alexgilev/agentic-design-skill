# Agentic Design

Product design intelligence for Claude Code, powered by a Notion RAG backend.

## Install

```bash
curl -sL yourdomain.com/api/install-skills | bash
```

Or via Claude Code plugin:
```
/plugin marketplace add your-org/agentic-design-skill
```

Or via Vercel skills CLI:
```bash
npx skills add your-org/agentic-design-skill
```

## What it does

Agentic Design analyzes UI against best practices pulled from a living Notion knowledge base. It enforces consistency, persists design decisions across sessions, and audits code for violations.

**Without Notion (embedded baseline):** Uses hardcoded design principles baked into the SKILL.md.

**With Notion RAG (the 10x version):** Queries your Notion knowledge base at runtime for the latest principles, cites them in proposals, and identifies gaps in your coverage.

## Commands

| Command | Description |
|---------|-------------|
| `/agentic-design:init` | Initialize design system for a project |
| `/agentic-design:status` | Show current design tokens and decisions |
| `/agentic-design:audit <path>` | Validate code against system + Agentic principles |
| `/agentic-design:extract <path>` | Extract patterns from existing code |
| `/agentic-design:query <topic>` | Query the Notion knowledge base directly |
| `/agentic-design:gaps` | Find uncovered design decisions |

## Notion Setup

1. Create a Notion integration at https://www.notion.so/my-integrations
2. Share your design principles database with the integration
3. Add the MCP config to your Claude Code settings:

```json
{
  "mcpServers": {
    "notion": {
      "command": "npx",
      "args": ["-y", "@notionhq/notion-mcp-server"],
      "env": {
        "OPENAPI_MCP_HEADERS": "{\"Authorization\": \"Bearer <YOUR_TOKEN>\", \"Notion-Version\": \"2022-06-28\"}"
      }
    }
  }
}
```

## Structure

```
.claude/skills/agentic-design/
  SKILL.md                    # Core skill (workflow + Notion RAG hooks + embedded baseline)
reference/
  system-template.md          # Blank system.md template
  examples/
    system-precision.md       # Dense/technical direction example
    system-warmth.md          # Consumer/friendly direction example
    system-sophistication.md  # Premium/trust direction example
scripts/
  audit.sh                    # Code audit script
  extract.sh                  # Pattern extraction script
api/
  install-skills.sh           # Bash installer (served by your API)
  route.ts                    # Next.js API route template
.claude-plugin/
  plugin.json                 # Plugin metadata + MCP config
  marketplace.json            # Marketplace registration
```

## How the RAG layer works

1. Skill activates → queries Notion for principles matching the current task
2. Retrieved principles override embedded baseline rules
3. Design decisions cite the specific Notion page they came from
4. Uncovered decisions are flagged as knowledge base gaps
5. `/agentic-design:gaps` suggests new pages to add

## License

MIT
