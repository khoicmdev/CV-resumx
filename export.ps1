# export.ps1 — Build resume PDF named after the current git branch
# Branch format expected: v[number]_[company]  →  e.g. v1_google, v2_stripe
# Output:  CAO_MINH_KHOI_Rv1_google.pdf

$branch = git rev-parse --abbrev-ref HEAD 2>$null

if (-not $branch -or $branch -eq "HEAD") {
    Write-Error "Could not determine git branch. Make sure you are on a named branch."
    exit 1
}

$outputName = "CAO_MINH_KHOI_R$branch"

Write-Host "Branch  : $branch"
Write-Host "Output  : $outputName.pdf"
Write-Host ""

resumx resume.md -o $outputName
