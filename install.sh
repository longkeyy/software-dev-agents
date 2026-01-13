#!/bin/bash

# Claude Code Agents - Plugin Installation Script
# Installs agents as a Claude Code plugin

set -e

echo "🚀 Claude Code Agents - Plugin Installation"
echo "============================================"

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Check for required files
if [ ! -f "$SCRIPT_DIR/.claude-plugin/plugin.json" ]; then
    echo "❌ Error: plugin.json not found"
    echo "Please ensure you're running from the claude-code-agents directory"
    exit 1
fi

if [ ! -d "$SCRIPT_DIR/agents" ]; then
    echo "❌ Error: agents directory not found"
    exit 1
fi

echo "✅ Plugin structure validated"

# Determine installation method
echo ""
echo "📋 Installation Options:"
echo ""
echo "1) Plugin mode (Recommended)"
echo "   - Register as a Claude Code plugin"
echo "   - Agents loaded on-demand"
echo "   - Better token efficiency"
echo ""
echo "2) Legacy mode"
echo "   - Copy agents to ~/.claude/agents/"
echo "   - All agents always available"
echo "   - Higher token usage"
echo ""

while true; do
    read -p "Choose installation method [1-2]: " choice
    case $choice in
        1)
            echo ""
            echo "📦 Installing as Claude Code plugin..."

            # Create plugins directory if not exists
            mkdir -p "$HOME/.claude/plugins"

            # Create symlink to plugin
            PLUGIN_LINK="$HOME/.claude/plugins/software-dev-agents"

            if [ -L "$PLUGIN_LINK" ] || [ -d "$PLUGIN_LINK" ]; then
                echo "  - Removing existing installation..."
                rm -rf "$PLUGIN_LINK"
            fi

            echo "  - Creating plugin symlink..."
            ln -s "$SCRIPT_DIR" "$PLUGIN_LINK"

            echo ""
            echo "✅ Plugin installed successfully!"
            echo "============================================"
            echo ""
            echo "🎯 Usage:"
            echo ""
            echo "The plugin is now registered. Claude will automatically"
            echo "select appropriate agents based on your questions."
            echo ""
            echo "📚 Available agent categories:"
            echo "   • Engineering: frontend, backend, algorithm, QA, data, infra"
            echo "   • Product: product managers, business analysts"
            echo "   • Creative: design, content writing"
            echo "   • Marketing: digital, growth, brand, social"
            echo "   • Sales: enterprise, presales"
            echo "   • Customer Service: support, success"
            echo ""
            echo "🔄 VP-level coordinators for cross-team tasks:"
            echo "   • vp-technology, vp-product, vp-creative"
            echo "   • vp-marketing, vp-sales, vp-customer"
            echo ""
            break
            ;;
        2)
            echo ""
            echo "📁 Installing in legacy mode..."

            # Create agents directory
            mkdir -p "$HOME/.claude/agents"

            # Copy agent files
            echo "  - Copying agent definitions..."
            cp -r "$SCRIPT_DIR/agents/"* "$HOME/.claude/agents/"

            # Copy workflow guide
            if [ -f "$SCRIPT_DIR/agent-workflow-guide.md" ]; then
                echo "  - Copying workflow guide..."
                cp "$SCRIPT_DIR/agent-workflow-guide.md" "$HOME/.claude/agent-workflow-guide.md"
            fi

            # Update claude.md if needed
            if [ -f "$HOME/.claude/claude.md" ]; then
                if ! grep -q "# Claude Code Agents - START" "$HOME/.claude/claude.md"; then
                    echo "  - Adding reference to claude.md..."
                    cat >> "$HOME/.claude/claude.md" << 'EOF'

# Claude Code Agents - START
@agent-workflow-guide.md
# Claude Code Agents - END
EOF
                fi
            else
                echo "  - Creating claude.md..."
                cat > "$HOME/.claude/claude.md" << 'EOF'
# Claude Code Agents - START
@agent-workflow-guide.md
# Claude Code Agents - END
EOF
            fi

            echo ""
            echo "✅ Legacy installation complete!"
            echo "============================================"
            echo ""
            echo "⚠️  Note: Legacy mode loads all agents at startup,"
            echo "   which may impact performance with large agent sets."
            echo ""
            echo "   Consider using plugin mode for better efficiency."
            echo ""
            break
            ;;
        *)
            echo "❌ Invalid choice. Please enter 1 or 2."
            ;;
    esac
done

echo "🗑️  To uninstall: ./uninstall.sh"
echo ""
echo "Happy coding! 🎉"
