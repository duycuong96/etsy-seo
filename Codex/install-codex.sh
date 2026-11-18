#!/usr/bin/env bash
# ============================================================
#  Etsy SEO Skill cho CODEX - Trinh cai dat (macOS / Linux)
#  Chay:  bash install-codex.sh
# ============================================================
set -e

cyan(){ printf "\033[36m%s\033[0m\n" "$1"; }
green(){ printf "\033[32m   [OK] %s\033[0m\n" "$1"; }
warn(){ printf "\033[33m   [!]  %s\033[0m\n" "$1"; }
err(){ printf "\033[31m   [X]  %s\033[0m\n" "$1"; }

echo ""
echo "==========================================================="
echo "   ETSY SEO SKILL (CODEX)  -  CAI DAT"
echo "==========================================================="

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC="$HERE/etsy-seo"
if [ ! -f "$SRC/SKILL.md" ]; then
  err "Khong thay thu muc etsy-seo/ canh file nay. Giai nen day du roi chay lai."
  exit 1
fi

# 1. Skill
cyan ">> Buoc 1/3: Cai skill etsy-seo vao ~/.agents/skills"
SKILL_DIR="$HOME/.agents/skills/etsy-seo"
if [ -d "$SKILL_DIR" ]; then
  BK="$HOME/.agents/skills-backup/etsy-seo-$(date +%Y%m%d-%H%M%S)"
  mkdir -p "$HOME/.agents/skills-backup"
  mv "$SKILL_DIR" "$BK"
  warn "Da co ban cu -> chuyen sang $BK"
fi
mkdir -p "$HOME/.agents/skills"
cp -R "$SRC" "$SKILL_DIR"
green "Skill cai tai: $SKILL_DIR"

# 2. Workspace
cyan ">> Buoc 2/3: Tao thu muc luu report"
mkdir -p "$HOME/Etsy-SEO/reports"
green "Report se luu tai: $HOME/Etsy-SEO/reports"

# 3. MCP
cyan ">> Buoc 3/3: Khai bao MCP ytrends + EverBee cho Codex"
echo "   Lay URL trong ChatGPT: Settings > Apps & Connectors > mo connector > MCP Server URL"
echo "   (Enter de bo qua, them sau cung duoc)"
CFG_DIR="$HOME/.codex"; CFG="$CFG_DIR/config.toml"
mkdir -p "$CFG_DIR"; touch "$CFG"
BACKED=0

add_mcp(){
  local name="$1" url="$2"
  [ -z "$url" ] && { warn "Bo qua $name"; return; }
  if grep -q "^\[mcp_servers\.$name\]" "$CFG"; then
    warn "$name da co trong config.toml -> giu nguyen, khong ghi de"
    return
  fi
  if [ "$BACKED" = 0 ]; then cp "$CFG" "$CFG.bak-$(date +%Y%m%d-%H%M%S)"; BACKED=1; fi
  printf '\n[mcp_servers.%s]\nurl = "%s"\n' "$name" "$url" >> "$CFG"
  green "Da them MCP $name"
}

read -r -p "   URL MCP ytrends: " YT_URL
add_mcp ytrends "$YT_URL"
read -r -p "   URL MCP EverBee: " EB_URL
add_mcp everbee "$EB_URL"

echo ""
echo "==========================================================="
green "HOAN TAT!"
echo "==========================================================="
echo "   1) Khoi dong lai Codex (thoat han roi mo lai)"
echo "   2) Go /skills  -> phai thay etsy-seo"
echo "   3) Go /mcp     -> phai thay ytrends + everbee (lan dau co the bat dang nhap)"
echo "   4) Keo anh design vao, go:  \$etsy-seo viet SEO Etsy cho design nay"
echo "   Report luu tai: $HOME/Etsy-SEO/reports"
echo ""
