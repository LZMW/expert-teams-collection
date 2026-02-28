@echo off
REM AI Expert Teams Collection - Windows 批量安装脚本
REM 一键安装所有9个专家团队

echo ========================================
echo   AI Expert Teams Collection
echo   批量安装脚本 (Windows)
echo ========================================
echo.

REM 获取脚本所在目录
set SCRIPT_DIR=%~dp0

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
echo 📁 本合集目录: %SCRIPT_DIR%
echo.

REM 检查 agents 和 skills 目录
if not exist "%SCRIPT_DIR%agents" (
    echo ❌ 错误: agents 目录不存在
    pause
    exit /b 1
)

if not exist "%SCRIPT_DIR%skills" (
    echo ❌ 错误: skills 目录不存在
    pause
    exit /b 1
)

echo 📦 开始安装到 Claude Code...
echo.

REM 复制 agents
echo 📋 安装 agents...
copy "%SCRIPT_DIR%agents\*.md" "%CLAUDE_DIR%\agents\" >nul
echo    ✅ agents 安装完成

REM 复制 skills
echo 🎨 安装 skills...
xcopy /E /I /Y "%SCRIPT_DIR%skills\*" "%CLAUDE_DIR%\skills\" >nul
echo    ✅ skills 安装完成

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
