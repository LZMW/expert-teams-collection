#!/bin/bash

# AI Expert Teams Collection - 批量安装脚本
# 一键安装所有9个专家团队

set -e

# 获取脚本所在目录
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "========================================"
echo "  🚀 AI Expert Teams Collection "
echo "  批量安装脚本"
echo "========================================"
echo ""

# 检查 Claude Code 目录
CLAUDE_DIR="$HOME/.claude"
if [ ! -d "$CLAUDE_DIR" ]; then
    echo "❌ 错误: Claude Code 目录不存在"
    echo "   请确保已安装 Claude Code"
    exit 1
fi

echo "✅ 找到 Claude Code 目录: $CLAUDE_DIR"
echo ""
echo "📁 本合集目录: $SCRIPT_DIR"
echo ""

# 检查 agents 和 skills 目录
if [ ! -d "$SCRIPT_DIR/agents" ]; then
    echo "❌ 错误: agents 目录不存在"
    exit 1
fi

if [ ! -d "$SCRIPT_DIR/skills" ]; then
    echo "❌ 错误: skills 目录不存在"
    exit 1
fi

echo "📦 开始安装到 Claude Code..."
echo ""

# 复制 agents
echo "📋 安装 agents..."
cp "$SCRIPT_DIR"/agents/*.md "$CLAUDE_DIR/agents/"
echo "   ✅ agents 安装完成"

# 复制 skills
echo "🎨 安装 skills..."
cp -r "$SCRIPT_DIR"/skills/* "$CLAUDE_DIR/skills/"
echo "   ✅ skills 安装完成"

echo ""
echo "========================================"
echo "  ✅ 安装完成！"
echo "========================================"
echo ""
echo "📝 安装统计："
echo "   - Agents: $(ls -1 "$CLAUDE_DIR/agents" | wc -l) 个"
echo "   - Skills: $(ls -1 "$CLAUDE_DIR/skills" | wc -l) 个"
echo ""
echo "⚠️  重要提示："
echo "   1. 请重启 Claude Code 以加载新配置"
echo "   2. 使用斜杠命令触发团队："
echo "      例如: /blackstone-coordinator 设计一个系统"
echo ""
echo "🎉 现在你拥有了9大精英团队！"
echo ""
