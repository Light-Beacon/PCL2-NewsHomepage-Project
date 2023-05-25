@echo off
cd ..
cd .\PCL2-NewsHomepage
chcp 65001
:loop
echo 正在推送...
git push origin main
if %ERRORLEVEL%==0 (
    echo 已成功推送到远端仓库！
    exit /b 0
) else (
    echo 推送到远端仓库失败，即将在 3 秒后重试...
    timeout /t 3 /nobreak
    goto :loop
)