@echo off
chcp 65001
cd ..
cd .\PCL2-NewsHomepage
:loop1
echo 正在推送资源文件...
git push origin main
if %ERRORLEVEL%==0 (
    echo 已成功推送资源文件到远端仓库！
    goto :pushproj
) else (
    echo 推送到远端仓库失败，即将在 3 秒后重试...
    timeout /t 3 /nobreak
    goto :loop1
)
:pushproj
cd ..
:loop2
echo 正在推送工程文件...
git push origin master
if %ERRORLEVEL%==0 (
    echo 已成功推送工程文件到远端仓库！
    goto :done
) else (
    echo 推送到远端仓库失败，即将在 3 秒后重试...
    timeout /t 3 /nobreak
    goto :loop2
)
:done
echo 推送完毕！将在 60 秒后退出...
timeout /t 60 /nobreak
exit /b 0