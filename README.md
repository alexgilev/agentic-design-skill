# Agentic Design

Product design intelligence for Claude Code, powered by a Notion RAG backend.

## Install

```bash
curl -sL https://raw.githubusercontent.com/alexgilev/agentic-design-skill/main/api/install-skills.sh | bash
```

For global install:

```bash
curl -sL https://raw.githubusercontent.com/alexgilev/agentic-design-skill/main/api/install-skills.sh | bash -s -- --global
```

> **Note:** Requires access to the private `agentic-design-internal` repo. The installer clones it via git.

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
"notion": {
  "command": "npx",
  "args": ["-y", "@notionhq/notion-mcp-server"],
  "env": {
    "OPENAPI_MCP_HEADERS": "{\"Authorization\": \"Bearer YOUR_TOKEN\", \"Notion-Version\": \"2022-06-28\"}"
  }
}
```

## License

MIT
