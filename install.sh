#!/usr/bin/env bash
# ============================================================
#  Etsy SEO Skill - Trinh cai dat tu dong (macOS / Linux)
#  Chay:  bash install.sh
# ============================================================
set -e

cyan(){ printf "\033[36m%s\033[0m\n" "$1"; }
green(){ printf "\033[32m   [OK] %s\033[0m\n" "$1"; }
warn(){ printf "\033[33m   [!]  %s\033[0m\n" "$1"; }
err(){ printf "\033[31m   [X]  %s\033[0m\n" "$1"; }

echo ""
echo "==========================================================="
echo "   ETSY SEO SKILL  -  CAI DAT TU DONG"
echo "==========================================================="

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 1. Node.js
cyan ">> Buoc 1/5: Kiem tra Node.js"
if ! command -v node >/dev/null 2>&1; then
  err "Chua co Node.js. Cai tai https://nodejs.org/ (hoac: brew install node) roi chay lai."
  exit 1
fi
green "Node.js $(node --version)"

# 2. Claude Code
cyan ">> Buoc 2/5: Cai Claude Code (CLI)"
npm install -g @anthropic-ai/claude-code >/dev/null 2>&1 || {
  err "Cai Claude Code that bai. Thu lai voi quyen phu hop."; exit 1; }
green "Claude Code da san sang"

# 3. Skill
cyan ">> Buoc 3/5: Cai skill etsy-seo"
SKILL_DIR="$HOME/.claude/skills/etsy-seo"
mkdir -p "$SKILL_DIR"
cp "$REPO_ROOT/SKILL.md" "$SKILL_DIR/"
[ -f "$REPO_ROOT/RULES.md" ] && cp "$REPO_ROOT/RULES.md" "$SKILL_DIR/"
[ -d "$REPO_ROOT/templates" ] && cp -R "$REPO_ROOT/templates" "$SKILL_DIR/"
green "Skill cai tai: $SKILL_DIR"

# 4. Workspace
cyan ">> Buoc 4/5: Tao thu muc luu ket qua"
mkdir -p "$HOME/Etsy-SEO/reports"
green "Report se luu tai: $HOME/Etsy-SEO/reports"

# 5. MCP
cyan ">> Buoc 5/5: Ket noi cong cu nghien cuu keyword (MCP)"
claude mcp remove trends-ytuong >/dev/null 2>&1 || true
if claude mcp add --scope user --transport http trends-ytuong https://mcp.trends.ytuong.ai/mcp >/dev/null 2>&1; then
  green "Da ket noi tool keyword research (trends-ytuong)"
else
  warn "Khong tu them duoc MCP. Chay tay:"
  echo "      claude mcp add --scope user --transport http trends-ytuong https://mcp.trends.ytuong.ai/mcp"
fi

echo ""
echo "==========================================================="
green "HOAN TAT!"
echo "==========================================================="
echo "   1) Go:  claude"
echo "   2) Lan dau: dang nhap tai khoan Claude"
echo "   3) Trong claude go:  /etsy-seo  + keo anh design vao"
echo "   Report luu tai: $HOME/Etsy-SEO/reports"
echo ""
