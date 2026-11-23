@~/.config/agents/AGENTS.md

# 仅 Claude Code：模型分派

- 主会话保持默认模型（Opus），负责规划、设计决策、复杂调试和最终判断。
- 简单、边界清晰的子任务（查找文件/符号、读代码总结、跑命令看输出、机械性小改动）交给 `quick-task` 子 agent（Sonnet）执行。
- 拿不准难度时留在主会话处理。
