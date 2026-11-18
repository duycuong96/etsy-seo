# ============================================================
#  Etsy SEO Skill cho CODEX - Trinh cai dat (Windows)
#  Chay: bam dup install-codex.bat (hoac: powershell -ExecutionPolicy Bypass -File install-codex.ps1)
# ============================================================
$ErrorActionPreference = "Stop"
function Cyan($m){ Write-Host $m -ForegroundColor Cyan }
function Ok($m){ Write-Host "   [OK] $m" -ForegroundColor Green }
function Warn($m){ Write-Host "   [!]  $m" -ForegroundColor Yellow }
function Err($m){ Write-Host "   [X]  $m" -ForegroundColor Red }

Write-Host ""
Write-Host "==========================================================="
Write-Host "   ETSY SEO SKILL (CODEX)  -  CAI DAT"
Write-Host "==========================================================="

$Here = Split-Path -Parent $MyInvocation.MyCommand.Path
$Src = Join-Path $Here "etsy-seo"
if (-not (Test-Path (Join-Path $Src "SKILL.md"))) {
  Err "Khong thay thu muc etsy-seo\ canh file nay. Giai nen day du roi chay lai."
  Read-Host "Bam Enter de thoat"; exit 1
}
$Stamp = Get-Date -Format "yyyyMMdd-HHmmss"

# 1. Skill
Cyan ">> Buoc 1/3: Cai skill etsy-seo vao ~\.agents\skills"
$SkillsRoot = Join-Path $env:USERPROFILE ".agents\skills"
$SkillDir = Join-Path $SkillsRoot "etsy-seo"
if (Test-Path $SkillDir) {
  $BkRoot = Join-Path $env:USERPROFILE ".agents\skills-backup"
  New-Item -ItemType Directory -Force -Path $BkRoot | Out-Null
  $Bk = Join-Path $BkRoot "etsy-seo-$Stamp"
  Move-Item $SkillDir $Bk
  Warn "Da co ban cu -> chuyen sang $Bk"
}
New-Item -ItemType Directory -Force -Path $SkillsRoot | Out-Null
Copy-Item -Recurse $Src $SkillDir
Ok "Skill cai tai: $SkillDir"

# 2. Workspace
Cyan ">> Buoc 2/3: Tao thu muc luu report"
$Reports = Join-Path $env:USERPROFILE "Etsy-SEO\reports"
New-Item -ItemType Directory -Force -Path $Reports | Out-Null
Ok "Report se luu tai: $Reports"

# 3. MCP
Cyan ">> Buoc 3/3: Khai bao MCP ytrends + EverBee cho Codex"
Write-Host "   Lay URL trong ChatGPT: Settings > Apps & Connectors > mo connector > MCP Server URL"
Write-Host "   (Enter de bo qua, them sau cung duoc)"
$CfgDir = Join-Path $env:USERPROFILE ".codex"
$Cfg = Join-Path $CfgDir "config.toml"
New-Item -ItemType Directory -Force -Path $CfgDir | Out-Null
if (-not (Test-Path $Cfg)) { New-Item -ItemType File -Path $Cfg | Out-Null }
$script:Backed = $false

function Add-Mcp($name, $url) {
  if ([string]::IsNullOrWhiteSpace($url)) { Warn "Bo qua $name"; return }
  $content = Get-Content $Cfg -Raw -ErrorAction SilentlyContinue
  if ($content -and ($content -match "(?m)^\[mcp_servers\.$name\]")) {
    Warn "$name da co trong config.toml -> giu nguyen, khong ghi de"; return
  }
  if (-not $script:Backed) { Copy-Item $Cfg "$Cfg.bak-$Stamp"; $script:Backed = $true }
  $block = "`n[mcp_servers.$name]`nurl = `"$($url.Trim())`"`n"
  [System.IO.File]::AppendAllText($Cfg, $block, (New-Object System.Text.UTF8Encoding($false)))
  Ok "Da them MCP $name"
}

Add-Mcp "ytrends" (Read-Host "   URL MCP ytrends")
Add-Mcp "everbee" (Read-Host "   URL MCP EverBee")

Write-Host ""
Write-Host "==========================================================="
Ok "HOAN TAT!"
Write-Host "==========================================================="
Write-Host "   1) Khoi dong lai Codex (thoat han roi mo lai)"
Write-Host "   2) Go /skills  -> phai thay etsy-seo"
Write-Host "   3) Go /mcp     -> phai thay ytrends + everbee (lan dau co the bat dang nhap)"
Write-Host "   4) Keo anh design vao, go:  `$etsy-seo viet SEO Etsy cho design nay"
Write-Host "   Report luu tai: $Reports"
Write-Host ""
Read-Host "Bam Enter de dong"
