# ============================================================
#  Etsy SEO Skill - Trinh cai dat tu dong (Windows)
#  Chay: double-click install.bat  (hoac: ./install.ps1)
# ============================================================

$ErrorActionPreference = "Stop"

function Write-Step($msg)  { Write-Host "`n>> $msg" -ForegroundColor Cyan }
function Write-Ok($msg)    { Write-Host "   [OK] $msg" -ForegroundColor Green }
function Write-Warn($msg)  { Write-Host "   [!]  $msg" -ForegroundColor Yellow }
function Write-Err($msg)   { Write-Host "   [X]  $msg" -ForegroundColor Red }

Write-Host ""
Write-Host "===========================================================" -ForegroundColor Magenta
Write-Host "   ETSY SEO SKILL  -  CAI DAT TU DONG" -ForegroundColor Magenta
Write-Host "===========================================================" -ForegroundColor Magenta

# Thu muc chua script nay (= goc repo da clone)
$RepoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path

# --- 1. Kiem tra Node.js + npm -------------------------------------------
Write-Step "Buoc 1/5: Kiem tra Node.js"
$node = Get-Command node -ErrorAction SilentlyContinue
if (-not $node) {
    Write-Warn "Chua co Node.js. Dang thu cai bang winget..."
    $winget = Get-Command winget -ErrorAction SilentlyContinue
    if ($winget) {
        winget install -e --id OpenJS.NodeJS.LTS --accept-source-agreements --accept-package-agreements
        Write-Warn "Da cai Node.js. Vui long DONG cua so nay, mo lai va chay install.bat lan nua."
        Read-Host "Nhan Enter de thoat"
        exit 1
    } else {
        Write-Err "May chua co Node.js va khong co winget."
        Write-Host "   -> Tai Node.js LTS tai: https://nodejs.org/  roi chay lai install.bat" -ForegroundColor Yellow
        Read-Host "Nhan Enter de thoat"
        exit 1
    }
}
$nodeVer = (node --version)
Write-Ok "Node.js $nodeVer"

# --- 2. Cai / cap nhat Claude Code ---------------------------------------
Write-Step "Buoc 2/5: Cai Claude Code (CLI)"
npm install -g @anthropic-ai/claude-code
if ($LASTEXITCODE -ne 0) {
    Write-Err "Cai Claude Code that bai (npm exit $LASTEXITCODE)."
    Write-Host "   -> Thu mo PowerShell voi quyen Admin (Run as Administrator) roi chay lai." -ForegroundColor Yellow
    Read-Host "Nhan Enter de thoat"
    exit 1
}
Write-Ok "Claude Code da san sang"

# Tim duong dan lenh claude (co the chua co tren PATH trong session nay)
$claudeCmd = "claude"
if (-not (Get-Command claude -ErrorAction SilentlyContinue)) {
    $npmPrefix = (npm config get prefix).Trim()
    $candidate = Join-Path $npmPrefix "claude.cmd"
    if (Test-Path $candidate) { $claudeCmd = $candidate }
}

# --- 3. Copy skill vao ~/.claude/skills/etsy-seo -------------------------
Write-Step "Buoc 3/5: Cai skill etsy-seo"
$SkillDir = Join-Path $env:USERPROFILE ".claude\skills\etsy-seo"
New-Item -ItemType Directory -Force -Path $SkillDir | Out-Null

Copy-Item (Join-Path $RepoRoot "SKILL.md") $SkillDir -Force
Copy-Item (Join-Path $RepoRoot "RULES.md") $SkillDir -Force -ErrorAction SilentlyContinue
$tplSrc = Join-Path $RepoRoot "templates"
if (Test-Path $tplSrc) {
    Copy-Item $tplSrc (Join-Path $SkillDir "templates") -Recurse -Force
}
Write-Ok "Skill cai tai: $SkillDir"

# --- 4. Tao workspace luu report -----------------------------------------
Write-Step "Buoc 4/5: Tao thu muc luu ket qua"
$Workspace = Join-Path $env:USERPROFILE "Etsy-SEO\reports"
New-Item -ItemType Directory -Force -Path $Workspace | Out-Null
Write-Ok "Report se luu tai: $(Join-Path $env:USERPROFILE 'Etsy-SEO\reports')"

# --- 5. Them MCP server trends-ytuong (keyword research) -----------------
Write-Step "Buoc 5/5: Ket noi cong cu nghien cuu keyword (MCP)"
try {
    & $claudeCmd mcp remove trends-ytuong 2>&1 | Out-Null
} catch { }
try {
    & $claudeCmd mcp add --scope user --transport http trends-ytuong https://mcp.trends.ytuong.ai/mcp 2>&1 | Out-Null
    Write-Ok "Da ket noi tool keyword research (trends-ytuong)"
} catch {
    Write-Warn "Khong tu them duoc MCP. Sau khi dang nhap claude, chay tay lenh:"
    Write-Host '      claude mcp add --scope user --transport http trends-ytuong https://mcp.trends.ytuong.ai/mcp' -ForegroundColor Yellow
}

# --- Xong ----------------------------------------------------------------
Write-Host ""
Write-Host "===========================================================" -ForegroundColor Green
Write-Host "   HOAN TAT! Cach dung:" -ForegroundColor Green
Write-Host "===========================================================" -ForegroundColor Green
Write-Host ""
Write-Host "   1) Mo cua so terminal MOI (de PATH cap nhat)"
Write-Host "   2) Go lenh:  claude"
Write-Host "   3) Lan dau: dang nhap tai khoan Claude theo huong dan tren man hinh"
Write-Host "   4) Trong claude, go:  /etsy-seo  roi keo tha anh design vao"
Write-Host ""
Write-Host "   Report luu tai:  %USERPROFILE%\Etsy-SEO\reports" -ForegroundColor Cyan
Write-Host ""
Read-Host "Nhan Enter de thoat"
