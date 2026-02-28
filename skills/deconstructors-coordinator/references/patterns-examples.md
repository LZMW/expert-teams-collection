# 协作模式示例

> 这些是参考示例，协调器可根据实际情况自由组合或创新

> ⚠️ **重要**：必须使用自然语言触发专家 agent

## 示例1：单专家模式

**适用场景**：特定阶段的独立任务

**触发方式**：
```
使用 deconstructors-profiler 子代理扫描项目技术栈
使用 deconstructors-strategist 子代理基于指纹报告制定分析策略
使用 deconstructors-hunter 子代理分析 [功能模块] 的调用链
使用 deconstructors-scribe 子代理创建/更新文档
```

## 示例2：完整 U.R.A.P 链式协作

**适用场景**：完整的代码库逆向分析与文档生成

**触发方式**：
```
步骤1: 使用 deconstructors-profiler 子代理执行技术栈指纹扫描...
       ↓ 获取《技术栈指纹报告》

步骤2: 使用 deconstructors-strategist 子代理基于指纹报告制定分析策略...
       ↓ 获取《分析策略声明》

步骤3: 使用 deconstructors-scribe 子代理初始化文档体系骨架...
       ↓ 获取文档框架

步骤4: 使用 deconstructors-hunter 子代理按照策略深度分析代码...
       ↓ 获取结构化知识

步骤5: 使用 deconstructors-scribe 子代理填充文档并执行质量验收...
       ↓ 获取完整文档体系
```

## 示例3：并行协作

**适用场景**：多个独立模块同时分析

**触发方式**：
```
同时触发多个 Hunter 子代理：
- 使用 deconstructors-hunter 子代理分析用户模块...
- 使用 deconstructors-hunter 子代理分析订单模块...
- 使用 deconstructors-hunter 子代理分析支付模块...

注意：并行触发时，每个任务描述要明确独立
```

## 示例4：快速扫描模式

**适用场景**：用户只需要快速了解项目概况

**触发方式**：
```
步骤1: 使用 deconstructors-profiler 子代理快速扫描技术栈...
步骤2: 使用 deconstructors-strategist 子代理基于扫描结果提供概要分析...
```

## 示例5：动态调整

**场景**：执行中发现新问题

**应对**：
- 原计划单专家，发现需要设计 → 切换链式
- 原计划链式，某环节简单 → 跳过或合并
- 发现遗漏专家能力 → 临时调整策略
- 遇到复杂问题 → 使用 AskUserQuestion 与用户确认

## 示例6：通过 description 自动匹配

专家 agent 的 description 会自动匹配任务：

```
协调器输出任务描述：
"扫描项目的技术栈、依赖和目录结构"

系统自动匹配到 profiler 的 description：
"Technology stack fingerprint scanner expert. Use proactively when scanning project tech stack..."
```

---

**关键**：
1. 必须使用自然语言触发
2. 每次触发后等待结果再进行下一步
3. 以上都是示例，协调器应保持灵活性
