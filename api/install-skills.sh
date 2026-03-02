#!/bin/bash
#
# Agentic Design Skill Installer
#
# Install:
#   curl -sL https://raw.githubusercontent.com/alexgilev/agentic-design-skill/main/api/install-skills.sh | bash
#
# It installs the Agentic Design skill into the user's
# Claude Code environment (project or global scope).
#
# --- CONFIGURATION ---
REPO_OWNER="alexgilev"
REPO_NAME="agentic-design-skill"
BRANCH="main"
SKILL_NAME="agentic-design"
# --- END CONFIGURATION ---

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'
BOLD='\033[1m'

echo ""
echo -e "${CYAN}=========================================${NC}"
echo -e "${BOLD} Agentic Design Skill Installer${NC}"
echo -e "${CYAN}=========================================${NC}"
echo ""

# --- Detect scope ---
SCOPE="project"
INSTALL_DIR=".claude/skills/${SKILL_NAME}"

if [ "$1" = "--global" ] || [ "$1" = "-g" ]; then
  SCOPE="global"
  INSTALL_DIR="${HOME}/.claude/skills/${SKILL_NAME}"
fi

echo -e " Scope: ${BOLD}${SCOPE}${NC}"
echo -e " Target: ${INSTALL_DIR}"
echo ""

# --- Check dependencies ---
if ! command -v git &> /dev/null && ! command -v curl &> /dev/null; then
  echo -e "${RED}Error: git or curl required${NC}"
  exit 1
fi

# --- Download ---
TEMP_DIR=$(mktemp -d)
trap "rm -rf $TEMP_DIR" EXIT

echo -e " ${CYAN}>${NC} Downloading skill files..."

CLONE_URL="https://github.com/${REPO_OWNER}/${REPO_NAME}.git"
TARBALL_URL="https://github.com/${REPO_OWNER}/${REPO_NAME}/archive/${BRANCH}.tar.gz"

if command -v git &> /dev/null; then
  git clone --depth 1 --branch "$BRANCH" "$CLONE_URL" "$TEMP_DIR/repo" 2>/dev/null
  REPO_DIR="$TEMP_DIR/repo"
else
  curl -sL "$TARBALL_URL" | tar xz -C "$TEMP_DIR"
  REPO_DIR="$TEMP_DIR/${REPO_NAME}-${BRANCH}"
fi

if [ ! -d "$REPO_DIR/.claude/skills/${SKILL_NAME}" ]; then
  echo -e "${RED}Error: Skill files not found in repository${NC}"
  exit 1
fi

# --- Install skill ---
echo -e " ${CYAN}>${NC} Installing skill..."
mkdir -p "$INSTALL_DIR"
cp -r "$REPO_DIR/.claude/skills/${SKILL_NAME}/"* "$INSTALL_DIR/"

# --- Install reference files ---
if [ -d "$REPO_DIR/reference" ]; then
  echo -e " ${CYAN}>${NC} Installing reference files..."
  mkdir -p "$INSTALL_DIR/reference"
  cp -r "$REPO_DIR/reference/"* "$INSTALL_DIR/reference/"
fi

# --- Install scripts ---
if [ -d "$REPO_DIR/scripts" ]; then
  echo -e " ${CYAN}>${NC} Installing audit scripts..."
  mkdir -p "$INSTALL_DIR/scripts"
  cp -r "$REPO_DIR/scripts/"* "$INSTALL_DIR/scripts/"
  chmod +x "$INSTALL_DIR/scripts/"*.sh 2>/dev/null || true
fi

# --- Install plugin config (global only) ---
if [ "$SCOPE" = "global" ] && [ -d "$REPO_DIR/.claude-plugin" ]; then
  echo -e " ${CYAN}>${NC} Registering plugin..."
  mkdir -p "${HOME}/.claude-plugin"
  cp -r "$REPO_DIR/.claude-plugin/"* "${HOME}/.claude-plugin/"
fi

# --- Done ---
echo ""
echo -e "${GREEN}=========================================${NC}"
echo -e "${GREEN} Done! Agentic Design skill installed${NC}"
echo -e "${GREEN}=========================================${NC}"
echo ""
echo -e " ${BOLD}Available commands:${NC}"
echo -e " /agentic-design:init    Initialize design system"
echo -e " /agentic-design:status  Show current system"
echo -e " /agentic-design:audit   Validate code"
echo -e " /agentic-design:extract Extract patterns"
echo -e " /agentic-design:query   Query Agentic knowledge base"
echo -e " /agentic-design:gaps    Find knowledge base gaps"
echo ""
echo -e " ${YELLOW}NOTE: For RAG features, configure the Notion MCP server:${NC}"
echo -e " Add to your Claude Code MCP config:"
echo ""
echo -e " ${CYAN}\"notion\": {"
echo -e "   \"command\": \"npx\","
echo -e "   \"args\": [\"-y\", \"@notionhq/notion-mcp-server\"],"
echo -e "   \"env\": {"
echo -e "     \"OPENAPI_MCP_HEADERS\": \"{\\\"Authorization\\\": \\\"Bearer <YOUR_TOKEN>\\\", \\\"Notion-Version\\\": \\\"2022-06-28\\\"}\""
echo -e "   }"
echo -e " }${NC}"
echo ""
