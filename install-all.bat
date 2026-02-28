@echo off
REM AI Expert Teams Collection - Windows 批量安装脚本
REM 一键安装所有9个专家团队

echo ========================================
echo   AI Expert Teams Collection
echo   批量安装脚本 (Windows)
echo ========================================
echo.

REM 检查 Claude Code 目录
set CLAUDE_DIR=%USERPROFILE%\.claude
if not exist "%CLAUDE_DIR%" (
    echo ❌ 错误: Claude Code 目录不存在
    echo    请确保已安装 Claude Code
    pause
    exit /b 1
)

echo ✅ 找到 Claude Code 目录: %CLAUDE_DIR%
echo.

REM 创建临时目录
set TEMP_DIR=%TEMP%\expert-teams-install
if exist "%TEMP_DIR%" rmdir /s /q "%TEMP_DIR%"
mkdir "%TEMP_DIR%"

echo 📁 创建临时目录: %TEMP_DIR%
echo.

REM 定义所有团队仓库
set TEAMS[0]=blackstone-team|https://github.com/LZMW/blackstone-team.git
set TEAMS[1]=cascade-team|https://github.com/LZMW/cascade-team.git
set TEAMS[2]=chromatic-team|https://github.com/LZMW/chromatic-team.git
set TEAMS[3]=code-vanguard|https://github.com/LZMW/code-vanguard.git
set TEAMS[4]=deepblue-bastion-team|https://github.com/LZMW/deepblue-bastion-team.git
set TEAMS[5]=frameforge-team|https://github.com/LZMW/frameforge-team.git
set TEAMS[6]=renaissance-team|https://github.com/LZMW/renaissance-team.git
set TEAMS[7]=sterilizer-team|https://github.com/LZMW/sterilizer-team.git
set TEAMS[8]=deconstructors|https://github.com/LZMW/urap-deconstructors.git

REM 克隆所有团队
echo 📥 开始克隆所有团队仓库...
echo.

for /L %%i in (0,1,8) do (
    for /f "tokens=1,2 delims=|" %%a in ("!TEAMS[%%i]!") do (
        echo 克隆 %%a...
        git clone %%b "%TEMP_DIR%\%%a"
        echo ✅ %%a 克隆完成
    )
)

echo.
echo 📦 开始安装到 Claude Code...
echo.

REM 复制 agents 和 skills
for /d %%d in ("%TEMP_DIR%\*") do (
    if exist "%%d\agents" (
        for %%f in ("%%d\agents\*.md") do (
            copy "%%f" "%CLAUDE_DIR%\agents\" >nul 2>&1
        )
        echo ✅ 安装 %%~nxd 的 agents
    )
    if exist "%%d\skills" (
        xcopy /E /I /Y "%%d\skills\*" "%CLAUDE_DIR%\skills\" >nul
        echo ✅ 安装 %%~nxd 的 skills
    )
)

REM 清理临时目录
echo.
echo 🧹 清理临时文件...
rmdir /s /q "%TEMP_DIR%"
echo ✅ 临时文件已清理

echo.
echo ========================================
echo   ✅ 安装完成！
echo ========================================
echo.
echo 📝 安装统计：
dir /b "%CLAUDE_DIR%\agents" | find /c /v ""
dir /b "%CLAUDE_DIR%\skills" | find /c /v ""
echo.
echo ⚠️  重要提示：
echo    1. 请重启 Claude Code 以加载新配置
echo    2. 使用斜杠命令触发团队：
echo       例如: /blackstone-coordinator 设计一个系统
echo.
echo 🎉 现在你拥有了9大精英团队！
echo.
pause
