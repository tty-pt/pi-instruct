# Autonomous Pi Coding Stack — 3-Minute Quickstart

Get a complete, fully-featured autonomous terminal engineering setup running with [Pi Coding Agent](https://github.com/earendil-works/pi-coding-agent) in under 3 minutes.

One configuration file gives you:
- **Persistent cross-session memory** (`pi-mm`)
- **Epistemic plan gating & verification** (`pi-quest`)
- **Non-blocking background execution & 5-model Fusion** (`pi-background-tasks`)
- **AST code knowledge graph** (`pi-cbm`)
- **Deterministic lossless compaction** (`pi-vcc`)
- **Multi-agent delegation & council** (`pi-subagents`)
- **Live terminal task HUD** (`rpiv-todo`)
- **Local neural acceleration & zero-cost embeddings** (`axil-auren`)

You **do not need to install extensions manually**. When you add packages to `~/.pi/agent/settings.json`, Pi automatically downloads, resolves, and loads all of them on startup.

---

## Platform Setup (Linux, macOS, Windows WSL2)

- **Linux & macOS**: Open your native terminal and ensure you have Node.js 22.19+ installed (`node -v`).
- **Windows (WSL2 Strongly Recommended)**: While native Node.js runs on Windows, the local C daemons (`axil`, `libaxil-auren.so`), shared object loaders, and terminal tools are natively compiled for Linux. Running inside **Windows Subsystem for Linux (WSL2)** is the battle-tested, zero-friction path on Windows:
  1. Open PowerShell as **Administrator** and run:
     ```powershell
     wsl --install
     ```
     *(If WSL is already installed, make sure it is updated: `wsl --update`)*.
  2. Restart Windows if prompted.
  3. Open **Ubuntu** from your Windows Start Menu, set up your username/password, and install Node.js 22 LTS:
     ```bash
     sudo apt update && sudo apt install -y curl build-essential
     curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
     sudo apt install -y nodejs
     ```
  4. Run all subsequent commands inside your Ubuntu terminal! *(Bonus: WSL2 automatically mirrors ports to Windows, so `localhost:4242` is shared seamlessly across both Windows and Linux).*

---

## 1. Install Pi Coding Agent

Requires Node.js 22.19+:

```bash
npm install -g @earendil-works/pi-coding-agent
```

---

## 2. Grab the All-in-One Configuration

Download our pre-configured `settings.json` into your global Pi agent config:

```bash
mkdir -p ~/.pi/agent
curl -fsSL https://raw.githubusercontent.com/tty-pt/pi-instruct/main/settings.json -o ~/.pi/agent/settings.json
```

*(If you already cloned this repository locally, you can simply run:)*
```bash
mkdir -p ~/.pi/agent
cp settings.json ~/.pi/agent/settings.json
```

*(Inspect the full configuration directly in [settings.json](settings.json)).*

---

## 3. (Optional Power-Up) Local Neural Daemon with axil-auren

Both `pi-mm` (long-term memory decision judging) and `pi-quest` (intent detection) are pre-configured to talk to a local neural daemon on `http://127.0.0.1:4242`.

Running **[axil-auren](https://github.com/tty-pt/axil-auren)** ([install instructions](https://github.com/tty-pt/axil-auren#installation--build)) locally gives you private, zero-latency local decisions and dense 384-dimensional vector embeddings without spending cloud tokens or sending data to third parties.

> 💡 **Quick Install on Debian / Ubuntu / WSL2**:
> ```bash
> sudo apt install axil axil-auren
> ```
> *(Or compile from source via `git clone https://github.com/tty-pt/axil-auren.git && cd axil-auren && make && sudo make install`)*.

### A. Download the two tiny models (~530 MB total):
```bash
mkdir -p ~/.models

# Generative Chat & Decision Judge (398 MB)
curl -L -o ~/.models/qwen2.5-0.5b-instruct.gguf \
  https://huggingface.co/Qwen/Qwen2.5-0.5B-Instruct-GGUF/resolve/main/qwen2.5-0.5b-instruct-q4_k_m.gguf

# Semantic Vector Embeddings (133 MB)
curl -L -o ~/.models/bge-small-en-v1.5.gguf \
  https://huggingface.co/CompendiumLabs/bge-small-en-v1.5-gguf/resolve/main/bge-small-en-v1.5-q8_0.gguf
```

### B. Start the axil-auren daemon on port 4242:
```bash
AUREN_JUDGE_MODEL="qwen" \
AUREN_JUDGE_PATH=~/.models/qwen2.5-0.5b-instruct.gguf \
AUREN_EMBED_MODEL="bge-small" \
AUREN_EMBED_PATH=~/.models/bge-small-en-v1.5.gguf \
axil -A -d -p 4242 -m libaxil-auren
```

> **Note**: If `axil-auren` is not running, both `pi-mm` and `pi-quest` safely degrade to built-in local heuristics without crashing.

---

## 4. Launch and Authenticate

Start Pi in your terminal:

```bash
pi
```

On first launch, Pi will automatically download and install all extension packages listed in your `settings.json`.

Then authenticate your provider:

```text
/login antigravity
```
*(Signs in with Google for access to Gemini 3.8 Flash and Gemini 2.5 Pro. Or use `/login anthropic` or `/login openai` if you prefer Claude or GPT).*

---

## 5. Enable in Your Project (`AGENTS.md`)

Pi reads project instructions from `AGENTS.md` in your repository root. Copy our starter template into any project to enforce plan gating, TDD, and task tracking:

```bash
cp templates/AGENTS.md ./AGENTS.md
```

---

## What Working With This Feels Like (The Real-World Difference)

Most terminal AI assistants suffer from common, frustrating pitfalls:
- **Amnesia**: You solve a tricky build quirk on Tuesday, but on Wednesday the agent makes the exact same mistake again because conversation history was compacted away.
- **Rushing to Code**: The agent blindly edits files without planning, introducing regressions before checking if existing tests even pass.
- **Terminal Lockup**: When running a 3-minute test suite or build, you're stuck staring at a frozen terminal.

**This stack fundamentally changes that dynamic:**
1. **Persistent Memory (`pi-mm`)**: Hard-won lessons, architectural rules, and verified fixes are permanently stored in local C tables (`libcorm` + `libsepal`). Across restarts and compactions, Pi automatically recalls relevant knowledge before each prompt.
2. **Epistemic Plan Gating (`pi-quest`)**: Pi cannot edit feature files until its Implementation Plan passes an automated adversarial review. Diffs must be proven against real tests before completing.
3. **Non-Blocking Background Tasks (`pi-background-tasks`)**: Long-running tests and builds run quietly in the background (`bg_run`), waking you only when finished.
4. **Local Acceleration (`axil-auren`)**: Private, sub-millisecond embeddings and quick classification decisions run directly on your machine at zero cloud token cost.

---

## What Just Got Installed? (Feature & Upstream Docs)

Each component is maintained independently. Refer to their official documentation for full API and configuration options:

| Extension / Component | What It Does | Official Documentation |
| :--- | :--- | :--- |
| **`@tty-pt/pi-mm`** | **Persistent Cross-Session Memory**: Stores lessons, verified bug fixes, and architectural invariants in local C DB (`libcorm`) + vector search (`libsepal`). Survives restarts. | [pi-mm Upstream Docs](https://github.com/tty-pt/pi-mm) |
| **`@tty-pt/pi-quest`** | **Epistemic Plan Gating**: Locks file editing until a plan passes adversarial review; validates diffs against real tests before shipping. | [pi-quest Upstream Docs](https://github.com/tty-pt/pi-quest) |
| **`pi-background-tasks`** | **Non-Blocking Execution & Fusion**: Runs long test suites and builds asynchronously (`bg_run`) while you chat; 5-model Fusion reasoning. | [pi-background-tasks Docs](https://github.com/ismailsaleekh/pi-background-tasks) |
| **`pi-cbm`** | **Code Knowledge Graph**: Direct AST graph navigation (`search_graph`, `trace_path`, `read_symbol`) powered by `codebase-memory-mcp`. | [codebase-memory-mcp Docs](https://github.com/DeusData/codebase-memory-mcp) |
| **`pi-vcc`** | **Deterministic Compaction**: Lossless algorithmic conversation compaction with `vcc_recall` history search. Saves tokens without hallucinations. | [pi-vcc Upstream Docs](https://github.com/buihongduc132/pi-vcc) |
| **`pi-subagents`** | **Multi-Agent Oversight**: Spawns isolated child agents (`scout`, `reviewer`, `oracle`, `worker`) and supervisor councils (`/council`). | [pi-subagents Upstream Docs](https://github.com/nicobailon/pi-subagents) |
| **`@juicesharp/rpiv-todo`** | **Live Task HUD**: Displays active tasks in an interactive terminal overlay directly above your prompt. | [rpiv-todo Upstream Docs](https://github.com/juicesharp/rpiv-mono/tree/main/packages/rpiv-todo) |
| **`pi-web-access`** | **Web Research & Grounding**: Real-time web search (Exa, Brave, SearXNG) and readable markdown page extraction. | [pi-web-access Upstream Docs](https://github.com/nicobailon/pi-web-access) |
| **`pi-antigravity`** | **Code Assist Provider**: Direct Google Cloud Code Assist connection with automatic account rotation on rate limits. | [pi-antigravity Upstream Docs](https://github.com/Rahularya01/pi-antigravity) |
| **`axil-auren`** | **Local Neural Daemon**: Ultra-compact C inference engine (`libaxil-auren`) for private embeddings and System One decisions. | [axil-auren Upstream Docs](https://github.com/tty-pt/axil-auren) \| [Install Guide](https://github.com/tty-pt/axil-auren#installation--build) |

---

## Core Systems & C Libraries (Under the Hood)

The persistent memory and local acceleration pipeline is built on compiled, pure-C systems:

| C Library / System | Role | Repository & Install Guide |
| :--- | :--- | :--- |
| **`libcorm`** | In-memory multidimensional index engine, unified recall kernel, and resident `cormd` daemon. | [libcorm README](https://github.com/tty-pt/libcorm) \| [Install Guide](https://github.com/tty-pt/libcorm#installation--build) |
| **`libsepal`** | Pure-C Approximate Nearest Neighbor (ANN) vector store with sign-bit Hamming sketches for sub-millisecond embeddings. | [libsepal README](https://github.com/tty-pt/libsepal) \| [Install Guide](https://github.com/tty-pt/libsepal#installation--build) |
| **`libjoint`** | Interval-tree temporal presence engine for querying co-presence and historical timeline windows. | [libjoint README](https://github.com/tty-pt/libjoint) \| [Install Guide](https://github.com/tty-pt/libjoint#installation--build) |
| **`liblemma`** | Diacritic-preserving full-text search tokenizer (`pão ≠ pao`) and memory-mapped inverted index. | [liblemma README](https://github.com/tty-pt/liblemma) \| [Install Guide](https://github.com/tty-pt/liblemma#installation--build) |
| **`axil`** | Ultra-lightweight C HTTP, WebSocket, and module application server. | [axil README](https://github.com/tty-pt/axil) \| [Install Guide](https://github.com/tty-pt/axil#installing) |

---

## Daily Hotkeys & Essential Commands

| Key / Command | Action |
| :--- | :--- |
| `Ctrl + Q` | Open the active **Quest Plan** viewer (`pi-quest`) |
| `Shift + Down` | Open the **Background Tasks Dock** (`pi-background-tasks`) |
| `Ctrl + Shift + T` | Toggle the **Todo Overlay Panel** (`rpiv-todo`) |
| `/quest doctor` | Check health of judge, models, and trigger word families |
| `/mm doctor` | Check health of memory judge and vector embeddings |
| `quest: <task>` | Start a quest deterministically using trigger prefixes (`quest:`, `fix:`, `task:`) |
| `@remember <note>` | Save knowledge directly to long-term memory |
| `Ctrl + C` | Cancel active generation or running tool |
| `Ctrl + D` | Exit Pi session |
