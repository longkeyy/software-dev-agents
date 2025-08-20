# Claude Code Agents

一个为 Claude Code 精心设计的企业级智能体定义库，提供覆盖完整软件开发生命周期的专业智能体。

## 🎯 项目初衷

在现代软件开发中，不同的问题需要不同领域的专业知识。Claude Code Agents 旨在：

- **专业化分工**：每个智能体专注特定领域，提供深度专业知识
- **智能协调**：VP 级智能体协调跨团队复杂任务
- **即插即用**：一键安装，全局可用，无需项目级配置
- **持续扩展**：模块化设计，支持持续添加新的专业领域

## 🏗️ 架构设计

### 三层智能体架构

- **专家级**：前端、后端、算法、测试、产品、设计、营销等各领域专家
- **VP级**：技术、产品、创意、营销、销售、客户等跨部门协调者
- **自动选择**：Claude 根据问题自动选择最合适的智能体或组合

### 覆盖领域

```
🏢 企业完整组织架构
├── 💻 技术部门：前后端、算法、数据、测试、架构、基础设施、安全
├── 📱 产品部门：产品经理、业务分析师、产品负责人
├── 🎨 创意部门：UX设计、视觉设计、内容创作、叙事设计
├── 🎯 营销部门：品牌、数字营销、增长、社媒营销
├── 💼 销售部门：销售、企业销售、售前技术支持
└── 🎧 客户服务：客户支持、技术支持、客户成功
```

## 🚀 快速开始

### 一键安装

```bash
# 克隆项目
git clone https://github.com/yourusername/claude-code-agents.git
cd claude-code-agents

# 一键安装到 Claude Code 全局配置
./install.sh
```

安装完成后，所有智能体全局可用，无需任何项目级配置！

### 使用示例

Claude 会自动理解您的需求并选择合适的智能体：

```bash
# 技术问题 → 自动调用技术专家
claude "优化这段 Go 代码的性能"
claude "React 组件重构建议"
claude "设计微服务架构"

# 产品策略 → 自动调用产品 VP
claude "设计用户权限系统"
claude "制定产品路线图"

# 跨团队协作 → 自动组合多个 VP
claude "新产品从设计到上线的完整方案"
claude "电商平台开发和营销策略"
```

### 手动指定智能体（可选）

```bash
# 指定特定专家
claude --agent golang-expert "Go 并发编程最佳实践"

# 组合多个智能体
claude --agents "vp-product,vp-technology" "设计 API 架构"
```

## 🔧 管理操作

### 查看已安装的智能体

```bash
# 查看所有智能体
ls ~/.claude/agents/departments/
ls ~/.claude/agents/workflows/

# 查看配置
cat ~/.claude/claude.md
```

### 更新智能体

```bash
# 拉取最新版本
git pull origin main

# 重新安装（会自动覆盖旧版本）
./install.sh
```

### 卸载

```bash
# 运行卸载脚本
./uninstall.sh
```

提供两种卸载选项：
- **完全移除**：删除所有智能体文件和配置
- **断开关联**：仅移除配置引用，保留文件

## 📁 项目结构

```
claude-code-agents/
├── agents/                  # 所有智能体定义
│   ├── departments/        # 按部门组织的专家智能体
│   │   ├── engineering/   # 技术部门（前后端、算法、数据、测试等）
│   │   ├── product/       # 产品部门
│   │   ├── creative/      # 创意部门（设计、内容）
│   │   ├── marketing/     # 营销部门
│   │   ├── sales/         # 销售部门
│   │   └── customer-service/ # 客户服务部门
│   └── workflows/          # VP 级协调者
├── agent-guide.md          # 智能体使用指南
├── install.sh              # 一键安装脚本
├── uninstall.sh            # 卸载脚本
└── README.md               # 项目说明
```

## 💡 智能选择机制

Claude Code 会根据您的问题智能选择：

- **单一技术问题** → 调用对应领域专家
- **跨团队协作** → 调用相关 VP 协调
- **复杂项目** → 自动组合多个 VP

无需记住智能体名称，直接描述需求即可！

## 📚 详细指南

- **使用指南**：[agent-guide.md](agent-guide.md)
- **安装后指南**：`~/.claude/agent-guide.md`
- **Claude Code 官方文档**：https://docs.anthropic.com/en/docs/claude-code

## 🔧 自定义智能体

### 创建新智能体

#### 方法一：使用 Poe 智能体创建器（推荐）

1. 访问 [ClaudeAgent-Creator](https://poe.com/ClaudeAgent-Creator)
2. 描述您需要的智能体功能和使用场景
3. 自动生成符合 Claude Code 标准的 markdown 文件
4. 将生成的文件保存到相应部门目录

#### 方法二：手动创建

1. 在相应部门目录下创建 `.md` 文件
2. 使用以下模板：

```markdown
---
name: {identifier}
description: |
  Use this agent when you need... [详细描述使用场景和示例]
---

{systemPrompt}
```

### 贡献指南

欢迎贡献新的智能体定义或改进现有定义！

1. Fork 本仓库
2. 创建特性分支 (`git checkout -b feature/new-agent`)
3. 提交更改 (`git commit -m 'feat: 添加新智能体'`)
4. 推送到分支 (`git push origin feature/new-agent`)
5. 创建 Pull Request

## 📜 许可证

MIT License

## 🙏 致谢

感谢所有贡献者和使用者，让这个项目变得更好！

## 📞 联系方式

- 问题反馈：[GitHub Issues](https://github.com/yourusername/claude-code-agents/issues)
- 讨论交流：[GitHub Discussions](https://github.com/yourusername/claude-code-agents/discussions)

---

⭐ 如果这个项目对您有帮助，请给个 Star 支持一下！