# AGENTS.md — Engineering Protocol & Project Guidelines

> Universal operational instructions for Pi Coding Agent operating in this repository.

---

## 1. Quick Orientation & Build Commands

```bash
make clean          # clean build artifacts
make                # compile native targets
make test           # run test suite
```

- Discover how to build and test before editing code.
- Always run the full test suite before declaring a task complete.

---

## 2. Unbreakable Architectural Invariants

1. **Test-Driven Development (TDD) Gate**: Write or update tests BEFORE implementing changes. Never delete or comment out existing tests without explicit human authorization.
2. **Deterministic Boundaries**: Keep module dependencies unidirectional. No circular dependencies across library boundaries.
3. **Clean Code Hygiene**: Zero compiler warnings under `-Wall -Wextra -Werror`. No leftover debug print statements or ad-hoc logging artifacts.

---

## 3. Autonomous Quest & Workflow Protocol

All multi-step engineering work uses the Quest Journal workflow (`pi-quest`):
- The assistant automatically initiates and maintains active quests on disk (`.pi/quest/future/<qid>.md`) from user intent without requiring manual syntax prefixes or ritual commands.
- **Drafting & Epistemic Gating**: File writes outside the quest document remain locked while researching context, enumerating requirements, citing file-backed evidence, and authoring an actionable implementation plan.
- **Adversarial Review Gate**: Drafts undergo independent adversarial subagent review before implementation begins.
- **Disciplined Execution**: Follow the approved plan strictly during implementation. Record unexpected discoveries as amendments.
- **Real Test Gate**: Completion requires proven verification via real test executions (exit code 0); never claim completion on unverified or failing code.

---

## 4. Task HUD Management (`rpiv-todo`)

- For any task requiring 3 or more steps, maintain an active todo list.
- Keep **exactly one** task `in_progress` at any time.
- Set a descriptive, present-continuous `activeForm` label (e.g. *"writing regression tests for socket timeout"*).
- Mark tasks `completed` immediately upon verification—never batch completions.
- Never mark a task `completed` if tests fail. Keep it `in_progress` and create a sub-task for the blocker.

---

## 5. Unified Codebase & Episodic Memory Protocol (`pi-mm`)

- ALWAYS prefer `memory_recall` over `grep` / `rg` for codebase symbols, AST definitions, call graphs, and past engineering lore:
  1. Symbol Search & Source Slices: `memory_recall({ scope: "code", query: "<symbol>" })` or `memory_recall({ symbol: "<Name>" })` for compact AST source slices with inbound/outbound callers.
  2. Call Graph Tracing: `memory_recall({ trace: "<symbol>", direction: "inbound" | "outbound" | "both", depth: 3 })`.
  3. Git Diff Blast Radius: `memory_recall({ diff: true, depth: 2 })` to map uncommitted line hunks to affected symbols and caller chains.
  4. Architectural Mipmap: `memory_recall({ scope: "code", overview: true })` for module clusters and dependency DAGs.
  5. Cross-Session Lore Recall: `memory_recall({ query: "<topic>", scope: "persistent" })` to look up verified solutions and historical invariants.
- Reserve `grep` or `rg` strictly for configuration files, build scripts, comments, and raw string literals.

---

## 6. Multi-Agent Delegation & Review (`pi-subagents`)

- Use `scout` for rapid codebase reconnaissance before writing complex plans.
- Before claiming completion, launch an independent `reviewer` subagent to audit the git diff for edge cases, null pointer safety, and architectural adherence.
- For risky design decisions, convene `/council` to debate trade-offs.

---

## 7. Episodic Memory Preservation (`pi-mm`)

- `pi-mm` automatically recalls relevant invariants and past resolutions before prompt execution.
- Before debugging unfamiliar errors, call `memory_recall` to check if a solution or invariant was previously discovered.
- After resolving an elusive bug, discovering a subsystem pitfall, or establishing an invariant, record it into long-term memory via `memory_record`:
  - Provide a concise `title`, actionable `note`, verified `testCommand`, and modified `files`.
  - The invariant persists across sessions and survives context resets indefinitely.
