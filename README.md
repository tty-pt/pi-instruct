# Autonomous Pi Coding Stack

A disciplined, autonomous engineering harness built on [Pi Coding Agent](https://github.com/earendil-works/pi-coding-agent).

Most tools treat AI like an autocomplete widget. This stack turns Pi into an autonomous software engineer that plans before touching files, remembers architectural invariants across restarts, and validates code with automated test gates.

---

## 60-Second Quickstart

### 1. Install Pi CLI
Requires Node.js 22.19+ (Linux, macOS, or Windows WSL2):
```bash
npm install -g @earendil-works/pi-coding-agent
```

### 2. Download Settings
Download the pre-configured `settings.json`:
```bash
mkdir -p ~/.pi/agent
curl -fsSL https://raw.githubusercontent.com/tty-pt/pi-instruct/main/settings.json -o ~/.pi/agent/settings.json
```

### 3. Launch
```bash
pi
```
Pi automatically downloads, installs, and configures all extensions on first startup. Authenticate with your preferred model provider (e.g. `/login antigravity`, `/login anthropic`, or `/login openai`).

---

## Core Repositories

- **[pi-quest](https://github.com/tty-pt/pi-quest)** — Epistemic plan gating & Argon-first orchestration. Locks file edits until the agent scouts context, authors a plan, and exchanges structured `[Drafter–Reviewer Dialogue]` rounds in an isolated `.pi/scratch/slot-N` worktree. Enforces real test execution before completion.
- **[pi-mm](https://github.com/tty-pt/pi-mm)** — Unified two-tier persistent memory (`scope: "persistent"`), ephemeral session recall & mipmap compaction (`scope: "session"`), and AST code intelligence (`scope: "code"`) powered by native C engines ([libmm](https://github.com/tty-pt/libmm), [libcorm](https://github.com/tty-pt/libcorm), [libsepal](https://github.com/tty-pt/libsepal), [liblemma](https://github.com/tty-pt/liblemma), [libislet](https://github.com/tty-pt/libislet), [libjoint](https://github.com/tty-pt/libjoint)). Replaces grep and LSP with instant AST symbol resolution, call graphs, diff blast radius, fault diagnosis, counterfactual guardrails, and cross-session memory.
- **[axil-auren](https://github.com/tty-pt/axil-auren)** — Local C embedding & reflex daemon on port 4242 (automatically provisioned via `@tty-pt/axil` + `@tty-pt/auren` prebuilds). Evaluates intent and reflex decisions via SIMD cosine dot products in ~5 ms with zero decode tokens and $0 API cost.

---

## Optional: System-Wide Native Package Installation (`axil-auren` & `libmm`)

Both `pi-mm` and `pi-quest` bundle `@tty-pt/*` npm prebuilds out of the box and automatically launch a shared background daemon at `http://127.0.0.1:4242`. You can also install the native OS packages system-wide:

```bash
# Ubuntu / Debian / WSL2:
wget -qO- https://tty.pt/apt/keyrings/archive-key.gpg | sudo tee /etc/apt/keyrings/ttypt.asc > /dev/null
echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/ttypt.asc] https://tty.pt/deb stable main" | sudo tee /etc/apt/sources.list.d/ttypt.list
sudo apt update && sudo apt install -y axil axil-auren libmm

# macOS (Homebrew):
brew tap tty-pt/tap https://github.com/tty-pt/tap.git
brew install axil axil-auren libmm
```

Start the daemon manually if desired (defaults to `bge-base` for embeddings and decision judging):
```bash
auren-server
```
*(If `axil-auren` is not running, extensions automatically start it or fall back to deterministic local heuristics without crashing).*

---

## Daily Hotkeys & Core Workflows

| Key / Command | Action |
| :--- | :--- |
| `Alt + J` | Toggle `pi-quest` On / Off for the current session (`/quest on` / `/quest off`) |
| `/quest` | View active Quest Status, triage drafts (`/quest list`), or manage slots (`/quest slots`) |
| `Shift + Down` | Open Background Tasks Dock (`pi-background-tasks`) |
| `Ctrl + Shift + T` | Toggle Todo Task HUD (`rpiv-todo`) |
| `memory_recall` | Instant AST symbol lookup, call graphs, diff blast radius, session turns, & persistent lore (`pi-mm`) |
| `memory_record` | Commit verified invariants, standing directives, and bug resolutions to persistent memory (`pi-mm`) |
| `bg_run` | Execute long-running test suites and builds asynchronously |
