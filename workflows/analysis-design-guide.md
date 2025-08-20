# 分析设计阶段指南

## 阶段概述

**目标**：从需求到方案的完整设计  
**时长**：通常 2-4 周  
**关键词**：需求分析、系统设计、技术选型

## 核心工作流程

### 1. 业务需求分析
**负责角色**：`business-analyst`
- 业务调研和需求收集
- 用户故事和场景分析  
- 业务流程梳理
- 竞品分析

### 2. 产品规划设计
**负责角色**：`product-manager`
- 产品功能规划
- 需求优先级排序
- 产品原型设计
- 项目路线图制定

### 3. 用户体验设计
**负责角色**：`ux-designer`
- 用户研究和画像
- 交互设计和原型
- 界面设计规范
- 用户体验流程

### 4. 技术架构设计
**负责角色**：`system-architect`
- 系统整体架构设计
- 技术选型评估
- 接口设计规范
- 性能和扩展性规划

### 5. 数据架构设计  
**负责角色**：`data-architect`
- 数据模型设计
- 数据流程规划
- 存储方案设计
- 数据治理规范

### 6. 安全架构设计
**负责角色**：`security-architect` (如有安全需求)
- 安全威胁分析
- 安全措施规划
- 合规要求评估
- 安全架构方案

## 推荐智能体组合

### 🏢 标准企业项目
```bash
claude --agents "business-analyst,product-manager,system-architect,data-architect,security-architect,ux-designer"
```

### 🚀 快速原型项目
```bash
claude --agents "product-manager,system-architect,ux-designer"
```

### 🤖 AI/数据驱动项目
```bash
claude --agents "business-analyst,product-manager,system-architect,data-architect,ml-architect"
```

### 📱 移动应用项目
```bash
claude --agents "product-manager,system-architect,ux-designer"
```

## 关键交付物

- ✅ 业务需求文档 (BRD)
- ✅ 产品需求文档 (PRD)  
- ✅ 系统架构设计文档
- ✅ 数据库设计文档
- ✅ 接口设计文档
- ✅ UI/UX设计稿
- ✅ 技术选型报告
- ✅ 安全设计方案

## 阶段完成标准

- [ ] 需求文档评审通过
- [ ] 架构设计评审通过
- [ ] 技术选型确定
- [ ] UI/UX原型确认
- [ ] 开发计划制定完成
- [ ] 风险识别和应对方案明确

## 下一阶段

完成分析设计阶段后，进入 [开发测试阶段](./development-guide.md)。