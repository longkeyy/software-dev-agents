# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**software-dev-agents** is a Claude Code plugin providing 80+ specialized AI agents for software development lifecycle management. It uses a three-tier architecture: Expert agents → VP-level coordinators → Automatic orchestration.

## Plugin Structure

```
.claude-plugin/plugin.json    # Plugin manifest
agents/
├── departments/              # Expert-level specialists (by domain)
│   ├── engineering/         # frontend/backend/algorithm/qa/data/infra/security/architecture
│   ├── product/             # PM, BA, PO
│   ├── creative/            # design, content
│   ├── marketing/           # digital, growth, brand, social
│   ├── sales/               # sales, enterprise, presales
│   └── customer-service/    # support, success
└── workflows/               # VP-level coordinators (vp-technology, vp-product, etc.)
```

## Agent File Format

All agents use markdown with YAML frontmatter:

```markdown
---
name: agent-identifier
description: |
  Concise description of when to use this agent (avoid verbose examples)
---

[System prompt defining expertise and behavior]
```

**Key constraint**: Keep `description` concise (< 600 chars). Examples and commentary should NOT be in description - they bloat token usage.

## Installation

```bash
./install.sh          # Choose "Plugin mode" (recommended)
./uninstall.sh        # Remove installation
```

Plugin mode creates symlink at `~/.claude/plugins/software-dev-agents`.

## Agent Invocation Logic

| Scenario | Agent Selection |
|----------|-----------------|
| Single technical problem | Domain expert (e.g., `golang-expert`, `react-expert`) |
| Cross-team coordination | VP agent (e.g., `vp-technology`, `vp-creative`) |
| Complex project | Multiple VPs combined |

## Optimization Scripts

```bash
python3 scripts/optimize-agents.py --dry-run   # Preview optimization
python3 scripts/optimize-agents.py             # Optimize descriptions (creates backup)
```

Reduces description token usage by ~70% by removing verbose examples.
