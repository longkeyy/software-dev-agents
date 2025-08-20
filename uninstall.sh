#!/bin/bash

# Claude Code Agents 卸载脚本
# 安全地移除agents或断开关联

set -e  # 遇到错误时退出

echo "🗑️ Claude Code Agents 卸载脚本"
echo "=================================="

# 检查 Claude Code 目录是否存在
if [ ! -d "$HOME/.claude" ]; then
    echo "❌ 未找到 ~/.claude 目录，无需卸载"
    exit 0
fi

# 检查是否已安装
if [ ! -d "$HOME/.claude/agents/departments" ] && [ ! -d "$HOME/.claude/agents/workflows" ]; then
    echo "❌ 未检测到已安装的 Claude Code Agents"
    exit 0
fi

echo "🤔 请选择卸载方式:"
echo ""
echo "1) 完全移除 - 删除所有相关文件"
echo "2) 断开关联 - 只禁用agents，保留文件"
echo "3) 取消卸载"
echo ""

while true; do
    read -p "请选择 [1-3]: " choice
    case $choice in
        1)
            echo ""
            echo "📁 正在完全移除 Claude Code Agents..."
            
            # 移除我们安装的具体目录
            if [ -d "$HOME/.claude/agents/departments" ]; then
                echo "  - 移除 ~/.claude/agents/departments/"
                rm -rf "$HOME/.claude/agents/departments"
            fi
            
            if [ -d "$HOME/.claude/agents/workflows" ]; then
                echo "  - 移除 ~/.claude/agents/workflows/"
                rm -rf "$HOME/.claude/agents/workflows"
            fi
            
            if [ -f "$HOME/.claude/agent-guide.md" ]; then
                echo "  - 移除 ~/.claude/agent-guide.md"
                rm -f "$HOME/.claude/agent-guide.md"
            fi
            
            # 尝试移除空的agents目录（如果确实为空）
            if [ -d "$HOME/.claude/agents" ]; then
                if [ -z "$(ls -A "$HOME/.claude/agents" 2>/dev/null)" ]; then
                    echo "  - 移除空的 agents 目录"
                    rmdir "$HOME/.claude/agents"
                else
                    echo "  - 保留 agents 目录（包含其他文件）"
                fi
            fi
            
            break
            ;;
        2)
            echo ""
            echo "🔗 正在断开 agents 关联..."
            echo "  - 文件将保留，仅禁用配置"
            
            break
            ;;
        3)
            echo "取消卸载"
            exit 0
            ;;
        *)
            echo "❌ 无效选择，请输入 1、2 或 3"
            ;;
    esac
done

# 清理 claude.md 中的配置
if [ -f "$HOME/.claude/claude.md" ]; then
    echo "⚙️ 清理配置文件..."
    
    # 创建临时文件
    temp_file=$(mktemp)
    
    # 移除我们的配置块
    awk '
    /^# Claude Code Agents - START/ { skip = 1; next }
    /^# Claude Code Agents - END/ { skip = 0; next }
    !skip { print }
    ' "$HOME/.claude/claude.md" > "$temp_file"
    
    # 替换原文件
    mv "$temp_file" "$HOME/.claude/claude.md"
    
    echo "  - 已从 ~/.claude/claude.md 中移除配置"
fi

echo ""
echo "✅ 卸载完成！"
echo "=================================="

if [ "$choice" = "2" ]; then
    echo ""
    echo "📝 断开关联完成:"
    echo "  - 文件已保留在 ~/.claude/agents/ 中"
    echo "  - 如需重新启用，请运行: ./install.sh"
    echo "  - 如需完全删除，请重新运行此脚本选择选项1"
else
    echo ""
    echo "🗑️ 文件移除完成:"
    echo "  - Claude Code Agents 已完全卸载"
    echo "  - 如需重新安装，请运行: ./install.sh"
fi

echo ""
echo "感谢使用 Claude Code Agents! 👋"