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

All complex work MUST use the Quest Journal workflow (`pi-quest`):
- Initiate complex tasks deterministically using trigger prefixes (`quest:`, `task:`, `fix:`, `feat:`, `@quest`) or `/quest <name>`.
- Run `/quest doctor` to verify judge connectivity and intent classification health.
- Drafting mode locks file writing to `.pi/quest/future/<qid>.md`. Use this phase to scout, list requirements, cite evidence, and author an actionable implementation plan.
- The plan must meet the maturity bar (2 requirements, or 1 requirement + 7 evidence items) to trigger adversarial review.
- Once promoted to implementing, follow the approved plan strictly. Record surprises as amendments.
- Validate your implementation by executing real tests. Once verified, claim completion with `quest_update_state({ claimComplete: true })`.

---

## 4. Task HUD Management (`rpiv-todo`)

- For any task requiring 3 or more steps, maintain an active todo list.
- Keep **exactly one** task `in_progress` at any time.
- Set a descriptive, present-continuous `activeForm` label (e.g. *"writing regression tests for socket timeout"*).
- Mark tasks `completed` immediately upon verification—never batch completions.
- Never mark a task `completed` if tests fail. Keep it `in_progress` and create a sub-task for the blocker.

---

## 5. Codebase Exploration Protocol (`pi-cbm`)

- ALWAYS prefer AST knowledge graph tools over raw grep/glob:
  1. `search_graph`: Find functions, classes, routes by name pattern.
  2. `trace_path`: Trace who calls a function or what it calls.
  3. `read_symbol` / `get_code_snippet`: Read exact function/class source code.
  4. `detect_changes`: Estimate blast radius of local git diffs.
- Fall back to `grep` or `find` only for configuration files, Dockerfiles, and raw string literals.

---

## 6. Multi-Agent Delegation & Review (`pi-subagents`)

- Use `scout` for rapid codebase reconnaissance before writing complex plans.
- Before claiming completion, launch an independent `reviewer` subagent to audit the git diff for edge cases, null pointer safety, and architectural adherence.
- For risky design decisions, convene `/council` to debate trade-offs.

---

## 7. Episodic Memory Preservation (`pi-mm`)

- Run `/mm doctor` to verify decision judge and vector embedding endpoint health.
- Use explicit trigger prefixes (`@remember <note>`, `remember: <note>`) to store verified invariants directly into long-term memory without token overhead.
- Before debugging unfamiliar errors, call `memory_recall` to check if a solution was previously discovered.
- After resolving an elusive bug or establishing a project invariant, call `memory_record` with the verified test command and git diff.
