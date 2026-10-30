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

- **[pi-quest](https://github.com/tty-pt/pi-quest)** — Epistemic plan gating. Locks file edits until the agent researches context, cites evidence, and passes an adversarial review. Validates diffs against real test runs before completing.
- **[pi-mm](https://github.com/tty-pt/pi-mm)** — Persistent memory mipmaps in pure C ([libcorm](https://github.com/tty-pt/libcorm)) and vector search ([libsepal](https://github.com/tty-pt/libsepal)). Automatically recalls past bug fixes and architectural rules across sessions.
- **[axil-auren](https://github.com/tty-pt/axil-auren)** — Local C daemon on port 4242. Evaluates intent and System 1 decisions via nearest-exemplar SIMD cosine dot products in ~5 ms with zero generated decode tokens and $0 cost.

---

## Optional: Local Neural Acceleration (`axil-auren`)

Both `pi-mm` and `pi-quest` automatically default to `http://127.0.0.1:4242` for zero-cost local decision judging and embeddings:

```bash
# Ubuntu / Debian / WSL2:
wget -qO- https://tty.pt/apt/keyrings/archive-key.gpg | sudo tee /etc/apt/keyrings/ttypt.asc > /dev/null
echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/ttypt.asc] https://tty.pt/deb stable main" | sudo tee /etc/apt/sources.list.d/ttypt.list
sudo apt update && sudo apt install -y axil axil-auren

# macOS (Homebrew):
brew tap tty-pt/tap https://github.com/tty-pt/tap.git
brew install axil axil-auren
```

Start the daemon (defaults to `bge-base` for embeddings and decision judging):
```bash
auren-server
```
*(If `axil-auren` is not running, extensions automatically fall back to deterministic local heuristics without crashing).*

---

## Daily Hotkeys & Commands

| Key / Command | Action |
| :--- | :--- |
| `Ctrl + Q` | View active Quest Plan (`pi-quest`) |
| `Shift + Down` | Open Background Tasks Dock (`pi-background-tasks`) |
| `Ctrl + Shift + T` | Toggle Todo Task HUD (`rpiv-todo`) |
| `/quest doctor` | Check quest engine and judge health |
| `/mm doctor` | Check memory engine and vector embedding health |
| `@remember <note>` | Save invariant or rule to persistent memory |
