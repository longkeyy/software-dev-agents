# 开发测试阶段指南

## 阶段概述

**目标**：设计方案的技术实现和质量保证  
**时长**：通常 6-12 周  
**关键词**：功能开发、质量测试、集成验证

## 核心工作流程

### 📋 阶段准备
- 确保分析设计阶段交付物完整
- 搭建开发环境和工具链
- 建立代码规范和协作流程

### 🔄 并行开发

#### 后端开发
**技术栈选择**：
- **Java项目**：`java-expert`
- **Go项目**：`golang-expert`  
- **Python项目**：`python-expert`
- **Node.js项目**：`nodejs-expert`

**主要任务**：
- API接口开发
- 业务逻辑实现
- 数据库操作
- 第三方服务集成

#### 前端开发

**Web前端选择**：
- **React项目**：`react-expert`
- **Vue项目**：`vue-expert`
- **Angular项目**：`angular-expert`

**移动端选择**：
- **Android原生**：`android-expert`
- **iOS原生**：`ios-expert`
- **鸿蒙应用**：`hongmeng-expert`
- **跨平台Flutter**：`flutter-expert`
- **跨平台RN**：`rn-expert`

#### 数据处理开发
**负责角色**：`bigdata-expert`, `etl-expert`
- ETL流程开发
- 数据管道搭建
- 数据质量监控
- 实时/离线处理

#### 算法模型开发  
**负责角色**：`ml-expert`, `nlp-expert`, `cv-expert`
- 机器学习模型开发
- 算法优化调试
- 模型训练和评估
- 模型服务化部署

### 🔍 质量保证

#### 测试验证
**负责角色**：`test-expert`, `automation-expert`, `performance-expert`
- 测试用例设计和执行
- 自动化测试框架搭建
- 性能测试和优化
- 集成测试验证

#### 代码审查
**负责角色**：`code-reviewer`
- 代码规范检查
- 安全漏洞扫描
- 性能问题识别
- 最佳实践推荐

## 推荐智能体组合

### 🏢 企业级Java全栈项目
```bash
# 开发团队
claude --agents "java-expert,react-expert,android-expert,ios-expert"

# 质量保证团队  
claude --agents "test-expert,automation-expert,performance-expert,code-reviewer"
```

### 🚀 Go微服务 + Vue管理后台
```bash
# 开发实现
claude --agents "golang-expert,vue-expert"

# 测试验证
claude --agents "test-expert,code-reviewer"
```

### 🤖 Python AI项目
```bash
# AI开发团队
claude --agents "python-expert,ml-expert,nlp-expert"

# Web服务
claude --agents "react-expert"

# 质量保证
claude --agents "test-expert,performance-expert"
```

### 📱 Flutter跨平台应用
```bash
# 移动开发
claude --agents "flutter-expert,golang-expert"

# 测试
claude --agents "test-expert,automation-expert"
```

### 📊 大数据平台
```bash
# 数据开发
claude --agents "java-expert,bigdata-expert,etl-expert"

# BI展示
claude --agents "vue-expert,bi-expert"
```

## 开发协作模式

### 🔗 前后端协作
1. **接口设计**：后端先定义API规范
2. **并行开发**：前后端基于Mock数据同步开发
3. **联调测试**：功能完成后进行集成测试

### 📱 多端协作
1. **API统一**：确保Web和移动端使用相同API
2. **设计一致**：保持跨平台用户体验一致性  
3. **数据同步**：处理多端数据同步问题

### 🤖 AI模型集成
1. **模型封装**：将AI模型封装为微服务API
2. **性能优化**：处理模型推理性能问题
3. **AB测试**：支持多模型版本并存

## 关键交付物

- ✅ 后端服务代码和API文档
- ✅ 前端应用代码  
- ✅ 移动应用安装包
- ✅ 数据处理管道代码
- ✅ AI模型和服务代码
- ✅ 自动化测试用例和报告
- ✅ 代码审查报告
- ✅ 性能测试报告
- ✅ 集成测试验证结果

## 阶段完成标准

- [ ] 所有功能模块开发完成
- [ ] 单元测试覆盖率达标 (>80%)
- [ ] 集成测试全部通过
- [ ] 性能测试满足要求
- [ ] 代码审查问题全部修复
- [ ] 安全扫描无严重问题
- [ ] 用户验收测试通过

## 下一阶段

完成开发测试阶段后，进入 [运营维护阶段](./operations-guide.md)。