#!/bin/bash

# Claude Code Agents 安装脚本
# 将agents安装到Claude Code的标准位置

set -e  # 遇到错误时退出

echo "🚀 Claude Code Agents 安装脚本"
echo "=================================="

# 检查 Claude Code 是否已安装
if [ ! -d "$HOME/.claude" ]; then
    echo "❌ 错误: 未找到 ~/.claude 目录"
    echo "请先安装 Claude Code: https://claude.ai/code"
    exit 1
fi

echo "✅ 检测到 Claude Code 已安装"

# 创建 agents 目录
echo "📁 创建 agents 目录结构..."
mkdir -p "$HOME/.claude/agents"

# 检查源文件是否存在
if [ ! -d "agents" ] || [ ! -f "agent-guide.md" ]; then
    echo "❌ 错误: 源文件不完整"
    echo "请确保在 claude-code-agents 项目根目录中运行此脚本"
    exit 1
fi

# 复制 agent 定义文件
echo "📋 复制 agent 定义文件..."
echo "  - 复制 agents/ → ~/.claude/agents/"
cp -r agents/* "$HOME/.claude/agents/"

echo "  - 复制 agent-guide.md → ~/.claude/agent-guide.md"
cp agent-guide.md "$HOME/.claude/agent-guide.md"

# 创建或更新主配置文件
echo "⚙️ 配置 Claude Code..."

# 检查 claude.md 是否存在
if [ ! -f "$HOME/.claude/claude.md" ]; then
    echo "  - 创建 ~/.claude/claude.md"
    touch "$HOME/.claude/claude.md"
fi

# 检查是否已经存在我们的配置
if ! grep -q "# Claude Code Agents - START" "$HOME/.claude/claude.md"; then
    echo "  - 添加 agents 配置到 claude.md"
    cat >> "$HOME/.claude/claude.md" << 'EOF'

# Claude Code Agents - START
@agent-guide.md
# Claude Code Agents - END
EOF
else
    echo "  - 配置已存在，跳过"
fi

echo ""
echo "✅ 安装完成！"
echo "=================================="
echo ""
echo "🎯 现在您可以使用以下方式调用 agents："
echo ""
echo "💻 单一技术问题:"
echo "   claude '优化这段Go代码的性能'"
echo "   claude '帮我review这个React组件'"
echo ""
echo "🤝 跨团队协作:"
echo "   claude '设计一个用户认证系统'"
echo "   claude '制定产品营销策略'"
echo ""
echo "🏢 复杂项目:"
echo "   claude '规划新产品从设计到上线'"
echo "   claude '完整的电商平台开发方案'"
echo ""
echo "📚 详细使用指南: ~/.claude/agent-guide.md"
echo "🗑️ 卸载: ./uninstall.sh"
echo ""
echo "Happy coding! 🎉"