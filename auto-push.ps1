# Daily auto commit & push for D:\GPT\web\html
# Registered in Task Scheduler as "GitAutoPush-mbc-lesson" (daily 14:00)
$repo = "D:\GPT\web\html"
$log = Join-Path $env:TEMP "git-auto-push.log"
Start-Transcript -Path $log -Append | Out-Null

Set-Location $repo
git add -A
if (git status --porcelain) {
    $stamp = Get-Date -Format "yyyy-MM-dd HH:mm"
    git commit -m "auto: daily sync $stamp"
}

# Sync with remote before pushing; abort cleanly on conflict
git pull --rebase origin main
if ($LASTEXITCODE -ne 0) {
    git rebase --abort
    Write-Output "PULL/REBASE FAILED - push skipped. Resolve conflicts manually."
    Stop-Transcript | Out-Null
    exit 1
}

git push origin main
Write-Output "Done. Exit code: $LASTEXITCODE"
Stop-Transcript | Out-Null
