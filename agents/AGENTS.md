# 用户全局配置

Codex、Claude Code、omp 共用此文件。标注"仅 xxx"的段落只在对应工具中生效。

## 沟通偏好

- 所有回复，无论主题，都必须以 `Ok Steven` 开头
- 默认用中文回复
- 回答简洁直接，不要啰嗦，不要重复我说的话
- 不要在回答末尾做总结或复述已完成的内容
- 不使用 emoji，除非我明确要求

## Git 与 PR

- 避免直接向 `main` 或 `master` 执行 `git push`；需要合入时优先走功能分支和 PR 流程。
- 若我要求直接推送到 `main` 或 `master`，先说明风险，并在执行前要求明确确认。
- 创建或更新 PR description / PR comment 时，默认只写 Summary；不要加入 `Test Plan` 或 `Tests` 段落，除非我明确要求。
- 分支命名：`<type>/<description>`，type 取 `feat` / `fix` / `hotfix` / `chore` / `docs` / `refactor` / `test` / `release`；描述全小写、连字符分词，50 字符内；有 issue 编号就放在描述开头（`feat/123-add-login`）。绝不用 `claude/` 或其他工具名做前缀。
- PR 标题：`<type>(<scope>): <祈使句描述>`，scope 可省略；祈使语气（`Add` 不是 `Added`），72 字符内，不以句号结尾；issue 编号写在正文，不放标题。
- 分支已有打开的 PR 时不要改分支名（GitHub 会关闭该 PR）。

## Ruby 运行时

- 调用 Ruby、Bundler、Rails 或 Rake 时，优先使用 rbenv 管理的 Ruby（例如 `rbenv exec ruby`、`rbenv exec bundle exec ...`），不要直接使用系统自带的 `/usr/bin/ruby`。

## 持久记忆

- 跨项目、跨工具的持久记忆在 `~/Documents/Obsidian/Ideaverse/Codex`；涉及具体项目或跨会话事项时，先读其中的 `AGENTS.md`，按它的规则读写和收尾。
- 工具内置记忆（Claude Code auto-memory、Codex memories）彼此不互通，只记本工具专用的信息；对其他工具也有用的偏好、决策、项目上下文写进 Obsidian Codex。

## 工作方式

- 声称完成、已修复或测试通过前，先实际运行验证并给出结果。
- 小而边界清晰的改动直接做，不需要设计审批、spec、worktree 或正式计划。
- 实质性扩大任务范围、创建 PR、推送代码或大量使用 subagent 前，先问我。

## Herdr Projects Coordinator

当工作目录是 `~/.herdr-projects/<slug>/`（包含 `PROJECT.md`、`TASKS.md`、`threads/`）时，我是该 herdr 项目的 coordinator，必须遵守：

- 每轮先运行 `herdr-projects --root ~/.herdr-projects context <slug>`，以命令输出的状态为准。
- 收到 `You are the coordinator...` priming 时，先运行 `skill`，再运行 `context`，不得跳过。
- coordinator 不亲自改代码、跑构建或建 PR；相关工作全部交给 `thread start` 启动的 threads（独立 worktree/branch）。
- 新工作先提出 threads 清单，等我明确批准后再启动（propose 模式）。
- 维护 `TASKS.md` 与 `MEMORY.md`/`memory/`；不得用内部 task 子代理冒充 herdr threads。

## 测试

- NEVER write unit tests after you write code.
- Highly prefer E2E tests as the sole testing mechanism. Use them to verify complex features work. At the end of E2E tests, produce a verifiable and repeatable artifact.
- If you must test a system in isolation, FIRST write all the ways it could fail, THEN write the code.
