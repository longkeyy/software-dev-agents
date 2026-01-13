#!/bin/bash

# Claude Code Agents - Uninstallation Script
# Removes plugin or legacy installation

set -e

echo "🗑️  Claude Code Agents - Uninstallation"
echo "========================================"

PLUGIN_LINK="$HOME/.claude/plugins/software-dev-agents"
LEGACY_AGENTS="$HOME/.claude/agents/departments"
LEGACY_WORKFLOWS="$HOME/.claude/agents/workflows"

# Check what's installed
HAS_PLUGIN=false
HAS_LEGACY=false

if [ -L "$PLUGIN_LINK" ] || [ -d "$PLUGIN_LINK" ]; then
    HAS_PLUGIN=true
fi

if [ -d "$LEGACY_AGENTS" ] || [ -d "$LEGACY_WORKFLOWS" ]; then
    HAS_LEGACY=true
fi

if [ "$HAS_PLUGIN" = false ] && [ "$HAS_LEGACY" = false ]; then
    echo "❌ No Claude Code Agents installation detected."
    exit 0
fi

echo ""
echo "📋 Detected installations:"
if [ "$HAS_PLUGIN" = true ]; then
    echo "   • Plugin mode: $PLUGIN_LINK"
fi
if [ "$HAS_LEGACY" = true ]; then
    echo "   • Legacy mode: ~/.claude/agents/{departments,workflows}"
fi

echo ""
echo "🤔 Select uninstallation option:"
echo ""
echo "1) Complete removal - Remove all installations"
echo "2) Plugin only - Remove plugin symlink"
echo "3) Legacy only - Remove legacy agent files"
echo "4) Cancel"
echo ""

while true; do
    read -p "Choose option [1-4]: " choice
    case $choice in
        1)
            echo ""
            echo "🧹 Removing all installations..."

            if [ "$HAS_PLUGIN" = true ]; then
                echo "  - Removing plugin symlink..."
                rm -rf "$PLUGIN_LINK"
            fi

            if [ "$HAS_LEGACY" = true ]; then
                echo "  - Removing legacy agent files..."
                rm -rf "$LEGACY_AGENTS"
                rm -rf "$LEGACY_WORKFLOWS"
                rm -f "$HOME/.claude/agent-workflow-guide.md"

                # Clean up empty agents directory
                if [ -d "$HOME/.claude/agents" ]; then
                    if [ -z "$(ls -A "$HOME/.claude/agents" 2>/dev/null)" ]; then
                        rmdir "$HOME/.claude/agents"
                    fi
                fi
            fi

            # Clean claude.md
            if [ -f "$HOME/.claude/claude.md" ]; then
                echo "  - Cleaning claude.md configuration..."
                temp_file=$(mktemp)
                awk '
                /^# Claude Code Agents - START/ { skip = 1; next }
                /^# Claude Code Agents - END/ { skip = 0; next }
                !skip { print }
                ' "$HOME/.claude/claude.md" > "$temp_file"
                mv "$temp_file" "$HOME/.claude/claude.md"
            fi

            break
            ;;
        2)
            if [ "$HAS_PLUGIN" = false ]; then
                echo "❌ No plugin installation found."
                continue
            fi

            echo ""
            echo "🧹 Removing plugin installation..."
            rm -rf "$PLUGIN_LINK"
            break
            ;;
        3)
            if [ "$HAS_LEGACY" = false ]; then
                echo "❌ No legacy installation found."
                continue
            fi

            echo ""
            echo "🧹 Removing legacy installation..."
            rm -rf "$LEGACY_AGENTS"
            rm -rf "$LEGACY_WORKFLOWS"
            rm -f "$HOME/.claude/agent-workflow-guide.md"

            # Clean up empty agents directory
            if [ -d "$HOME/.claude/agents" ]; then
                if [ -z "$(ls -A "$HOME/.claude/agents" 2>/dev/null)" ]; then
                    rmdir "$HOME/.claude/agents"
                fi
            fi

            # Clean claude.md
            if [ -f "$HOME/.claude/claude.md" ]; then
                echo "  - Cleaning claude.md configuration..."
                temp_file=$(mktemp)
                awk '
                /^# Claude Code Agents - START/ { skip = 1; next }
                /^# Claude Code Agents - END/ { skip = 0; next }
                !skip { print }
                ' "$HOME/.claude/claude.md" > "$temp_file"
                mv "$temp_file" "$HOME/.claude/claude.md"
            fi

            break
            ;;
        4)
            echo "Cancelled."
            exit 0
            ;;
        *)
            echo "❌ Invalid choice. Please enter 1-4."
            ;;
    esac
done

echo ""
echo "✅ Uninstallation complete!"
echo "========================================"
echo ""
echo "To reinstall: ./install.sh"
echo ""
echo "Thanks for using Claude Code Agents! 👋"
