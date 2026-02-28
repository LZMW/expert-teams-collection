#!/bin/bash

# AI Expert Teams Collection - 批量安装脚本
# 一键安装所有9个专家团队

set -e

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

# 定义所有团队仓库
declare -A TEAMS=(
    ["blackstone-team"]="https://github.com/LZMW/blackstone-team.git"
    ["cascade-team"]="https://github.com/LZMW/cascade-team.git"
    ["chromatic-team"]="https://github.com/LZMW/chromatic-team.git"
    ["code-vanguard"]="https://github.com/LZMW/code-vanguard.git"
    ["deepblue-bastion-team"]="https://github.com/LZMW/deepblue-bastion-team.git"
    ["frameforge-team"]="https://github.com/LZMW/frameforge-team.git"
    ["renaissance-team"]="https://github.com/LZMW/renaissance-team.git"
    ["sterilizer-team"]="https://github.com/LZMW/sterilizer-team.git"
    ["deconstructors-team"]="https://github.com/LZMW/urap-deconstructors.git"
)

# 创建临时目录
TEMP_DIR=$(mktemp -d)
echo "📁 创建临时目录: $TEMP_DIR"
echo ""

# 克隆所有团队
echo "📥 开始克隆所有团队仓库..."
echo ""

for team in "${!TEAMS[@]}"; do
    repo="${TEAMS[$team]}"
    echo "克隆 $team..."
    git clone "$repo" "$TEMP_DIR/$team"
    echo "✅ $team 克隆完成"
done

echo ""
echo "📦 开始安装到 Claude Code..."
echo ""

# 复制 agents 和 skills
for team_dir in "$TEMP_DIR"/*; do
    if [ -d "$team_dir/agents" ]; then
        team_name=$(basename "$team_dir")
        echo "📋 安装 $team_name 的 agents..."
        cp "$team_dir"/agents/*.md "$CLAUDE_DIR/agents/" 2>/dev/null || true
        echo "   ✅ agents 安装完成"
    fi

    if [ -d "$team_dir/skills" ]; then
        echo "🎨 安装 $team_name 的 skills..."
        cp -r "$team_dir"/skills/* "$CLAUDE_DIR/skills/" 2>/dev/null || true
        echo "   ✅ skills 安装完成"
    fi
done

# 清理临时目录
echo ""
echo "🧹 清理临时文件..."
rm -rf "$TEMP_DIR"
echo "✅ 临时文件已清理"

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
