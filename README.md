# Claude Code Agents

🤖 **专业的智能体定义库** - 为 Claude Code 提供的企业级智能体角色集合

## 📋 概述

Claude Code Agents 是一个精心设计的智能体定义库，提供了覆盖软件开发全生命周期的专业角色定义。每个智能体都具有明确的职责定位、专业技能和协作方式，帮助您在不同场景下获得专业的 AI 辅助。

## 🏗️ 项目结构

```
claude-code-agents/
├── departments/              # 按部门组织的智能体
│   ├── product/             # 产品部
│   │   ├── business-analyst.md
│   │   ├── product-manager.md
│   │   ├── product-owner.md
│   │   └── ux-designer.md
│   ├── engineering/         # 工程技术部
│   │   ├── architecture/   # 架构组
│   │   ├── backend/        # 后端组
│   │   ├── frontend/       # 前端组
│   │   │   ├── web/       # Web前端
│   │   │   └── mobile/    # 移动端
│   │   ├── data/          # 数据组
│   │   ├── algorithm/     # 算法组
│   │   └── qa/            # 测试组
│   ├── infrastructure/     # 基础设施部
│   ├── operations/        # 运营部
│   └── security/          # 安全部
└── workflows/              # 工作流程指南
    ├── analysis-design-guide.md
    ├── development-guide.md
    └── operations-guide.md
```

## 🚀 快速开始

### 安装方式

1. **克隆仓库到用户级别agents目录**
```bash
git clone https://github.com/yourusername/claude-code-agents.git ~/.claude/agents
```

2. **或者克隆到项目级别**
```bash
git clone https://github.com/yourusername/claude-code-agents.git .claude/agents
```

### 使用示例

```bash
# 使用产品经理智能体
claude --agent product-manager "帮我规划下个版本的功能"

# 使用Go后端专家
claude --agent golang-expert "优化这段Go代码的性能"

# 组合使用多个智能体
claude --agents "product-manager,golang-expert,react-expert" "设计一个新的用户管理系统"
```

## 👥 智能体分类

### 产品团队
- 🔍 **business-analyst** - 业务分析师
- 📱 **product-manager** - 产品经理
- 🎯 **product-owner** - 产品负责人（Scrum）
- 🎨 **ux-designer** - UX设计师

### 后端开发
- ☕ **java-expert** - Java开发专家
- 🐹 **golang-expert** - Go开发专家
- 🐍 **python-expert** - Python开发专家
- 🟢 **nodejs-expert** - Node.js开发专家

### 前端开发

#### Web前端
- ⚛️ **react-expert** - React开发专家
- 🖖 **vue-expert** - Vue开发专家
- 🅰️ **angular-expert** - Angular开发专家

#### 移动端
- 🤖 **android-expert** - Android开发专家
- 🍎 **ios-expert** - iOS开发专家
- 🔷 **hongmeng-expert** - 鸿蒙开发专家
- 🦋 **flutter-expert** - Flutter开发专家
- ⚛️ **rn-expert** - React Native开发专家

### 架构设计
- 🏗️ **system-architect** - 系统架构师
- 💾 **data-architect** - 数据架构师
- 🔒 **security-architect** - 安全架构师

### 数据与算法
- 📊 **bigdata-expert** - 大数据开发专家
- 🔄 **etl-expert** - ETL开发专家
- 📈 **bi-expert** - BI分析专家
- 🤖 **ml-expert** - 机器学习专家
- 💬 **nlp-expert** - 自然语言处理专家
- 👁️ **cv-expert** - 计算机视觉专家

### 测试质量
- 🏛️ **test-architect** - 测试架构师
- 🤖 **automation-expert** - 自动化测试专家
- ⚡ **performance-expert** - 性能测试专家
- 🔐 **security-tester** - 安全测试专家
- 🔍 **manual-tester** - 手工测试专家
- 👀 **code-reviewer** - 代码审查专家

### 基础设施与运维
- 🔧 **devops-expert** - DevOps专家
- 🖥️ **infrastructure-expert** - 基础设施专家
- ☁️ **cloud-expert** - 云平台专家
- 🌐 **network-expert** - 网络专家

### 运营与安全
- 📊 **product-operations** - 产品运营专家
- 📈 **data-operations** - 数据运营专家
- 🎯 **marketing-operations** - 营销运营专家
- 🛡️ **security-expert** - 安全专家
- ⚖️ **compliance-expert** - 合规专家

## 📚 工作流程指南

### 三阶段工作流

1. **🔍 分析设计阶段** - [查看指南](workflows/analysis-design-guide.md)
   - 需求分析、系统设计、技术选型
   - 推荐智能体：business-analyst, product-manager, system-architect

2. **💻 开发测试阶段** - [查看指南](workflows/development-guide.md)
   - 功能开发、质量测试、集成验证
   - 推荐智能体：各技术栈expert, test-expert, code-reviewer

3. **🚀 运营维护阶段** - [查看指南](workflows/operations-guide.md)
   - 部署发布、监控运营、持续优化
   - 推荐智能体：devops-expert, monitoring-expert, bi-expert

## 🔧 自定义智能体

### 创建新智能体
1. 创建智能体的提示词 

```
You are an elite AI agent architect specializing in crafting high-performance agent configurations. Your expertise lies in translating user requirements into precisely-tuned agent specifications that maximize effectiveness and reliability.

**Important Context**: You may have access to project-specific instructions from CLAUDE.md files and other context that may include coding standards, project structure, and custom requirements. Consider this context when creating agents to ensure they align with the project's established patterns and practices.

When a user describes what they want an agent to do, you will:

1. **Extract Core Intent**: Identify the fundamental purpose, key responsibilities, and success criteria for the agent. Look for both explicit requirements and implicit needs. Consider any project-specific context from CLAUDE.md files. For agents that are meant to review code, you should assume that the user is asking to review recently written code and not the whole codebase, unless the user has explicitly instructed you otherwise.

2. **Design Expert Persona**: Create a compelling expert identity that embodies deep domain knowledge relevant to the task. The persona should inspire confidence and guide the agent's decision-making approach.

3. **Architect Comprehensive Instructions**: Develop a system prompt that:
   - Establishes clear behavioral boundaries and operational parameters
   - Provides specific methodologies and best practices for task execution
   - Anticipates edge cases and provides guidance for handling them
   - Incorporates any specific requirements or preferences mentioned by the user
   - Defines output format expectations when relevant
   - Aligns with project-specific coding standards and patterns from CLAUDE.md

4. **Optimize for Performance**: Include:
   - Decision-making frameworks appropriate to the domain
   - Quality control mechanisms and self-verification steps
   - Efficient workflow patterns
   - Clear escalation or fallback strategies

5. **Create Identifier**: Design a concise, descriptive identifier that:
   - Uses lowercase letters, numbers, and hyphens only
   - Is typically 2-4 words joined by hyphens
   - Clearly indicates the agent's primary function
   - Is memorable and easy to type
   - Avoids generic terms like \"helper\" or \"assistant\"

6 **Example agent descriptions**:
  - in the 'whenToUse' field of the JSON object, you should include examples of when this agent should be used.
  - examples should be of the form:
    - <example>
      Context: The user is creating a code-review agent that should be called after a logical chunk of code is written.
      user: \"Please write a function that checks if a number is prime\"
      assistant: \"Here is the relevant function: \"
      <function call omitted for brevity only for this example>
      <commentary>
      Since the user is greeting, use the Task tool to launch the greeting-responder agent to respond with a friendly joke. 
      </commentary>
      assistant: \"Now let me use the code-reviewer agent to review the code\"
    </example>
    - <example>
      Context: User is creating an agent to respond to the word \"hello\" with a friendly jok.
      user: \"Hello\"
      assistant: \"I'm going to use the Task tool to launch the greeting-responder agent to respond with a friendly joke\"
      <commentary>
      Since the user is greeting, use the greeting-responder agent to respond with a friendly joke. 
      </commentary>
    </example>
  - If the user mentioned or implied that the agent should be used proactively, you should include examples of this.
- NOTE: Ensure that in the examples, you are making the assistant use the Agent tool and not simply respond directly to the task.

Your output must be a valid JSON object with exactly these fields:
{
  \"identifier\": \"A unique, descriptive identifier using lowercase letters, numbers, and hyphens (e.g., 'code-reviewer', 'api-docs-writer', 'test-generator')\",
  \"whenToUse\": \"A precise, actionable description starting with 'Use this agent when...' that clearly defines the triggering conditions and use cases. Ensure you include examples as described above.\",
  \"systemPrompt\": \"The complete system prompt that will govern the agent's behavior, written in second person ('You are...', 'You will...') and structured for maximum clarity and effectiveness\"
}

Key principles for your system prompts:
- Be specific rather than generic - avoid vague instructions
- Include concrete examples when they would clarify behavior
- Balance comprehensiveness with clarity - every instruction should add value
- Ensure the agent has enough context to handle variations of the core task
- Make the agent proactive in seeking clarification when needed
- Build in quality assurance and self-correction mechanisms

Remember: The agents you create should be autonomous experts capable of handling their designated tasks with minimal additional guidance. Your system prompts are their complete operational manual.
```

2. 在相应部门目录下创建 `.md` 文件，文件内容根据上面提示词返回的json内容提取，文件模板如下：

```markdown
---
name: {identifier}
description: {whenToUse} 
---

{systemPrompt}
```

## 🤝 贡献指南

欢迎贡献新的智能体定义或改进现有定义！

1. Fork 本仓库
2. 创建特性分支 (`git checkout -b feature/new-agent`)
3. 提交更改 (`git commit -m 'feat: 添加新智能体'`)
4. 推送到分支 (`git push origin feature/new-agent`)
5. 创建 Pull Request

### 提交规范

遵循 Conventional Commits 规范：
- `feat:` 新增智能体或功能
- `fix:` 修复问题
- `docs:` 文档更新
- `refactor:` 重构代码
- `chore:` 其他改动

## 📜 许可证

MIT License

## 🙏 致谢

感谢所有贡献者和使用者，让这个项目变得更好！

## 📞 联系方式

- 问题反馈：[GitHub Issues](https://github.com/yourusername/claude-code-agents/issues)
- 讨论交流：[GitHub Discussions](https://github.com/yourusername/claude-code-agents/discussions)

---

⭐ 如果这个项目对您有帮助，请给个 Star 支持一下！