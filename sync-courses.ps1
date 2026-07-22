# サーキット生成パイプラインからコースを取り込む
# 使い方:
#   .\sync-courses.ps1                       # 既定のコース一覧を同期
#   .\sync-courses.ps1 kart_meadow,kart_xxx  # 指定コースだけ同期
#
# 注意: このゲームの物理は平面（y=0）前提なので、
#       height_wave: 0 / banking_max_deg: 0 でビルドしたコースだけを入れること。
param(
    [string[]]$Courses = @("kart_meadow", "kart_canyon", "kart_city")
)

$pipeline = Join-Path (Split-Path $PSScriptRoot -Parent) "20260707_サーキット生成パイプライン\dist"
$dest = Join-Path $PSScriptRoot "courses"
if (-not (Test-Path $pipeline)) { Write-Error "パイプラインのdistが見つかりません: $pipeline"; exit 1 }
New-Item -ItemType Directory -Force $dest | Out-Null

$catalog = @()
foreach ($name in $Courses) {
    $manifestPath = Join-Path $pipeline "$name.manifest.json"
    if (-not (Test-Path $manifestPath)) {
        Write-Warning "$name のmanifestがありません（先に build.ps1 $name を実行）"
        continue
    }
    $m = Get-Content $manifestPath -Encoding UTF8 | ConvertFrom-Json
    foreach ($f in @($m.file, $m.waypoints, $m.thumb)) {
        Copy-Item (Join-Path $pipeline $f) $dest -Force
    }
    $catalog += $m
    Write-Host "OK: $name (コース$($m.track_length_m)m, $($m.tris) tris)"
}

ConvertTo-Json -InputObject @($catalog) -Depth 5 | Out-File (Join-Path $dest "catalog.json") -Encoding utf8
Write-Host "courses/catalog.json を更新（$($catalog.Count)コース）"
