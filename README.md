# Pi Autonomous Coding Stack — Setup Guide

Replicate our autonomous **[Pi Coding Agent](https://github.com/earendil-works/pi-coding-agent)** engineering setup in one step.

You **do not need to install extensions manually**. When you add packages to `~/.pi/agent/settings.json`, Pi automatically downloads, resolves, and loads all of them when it starts.

---

## The Philosophy: Agentic Engineering vs. Prompt-and-Pray

Most developers use AI like an autocomplete or an interactive chatbot:
> *Prompt $\rightarrow$ Wait $\rightarrow$ Check $\rightarrow$ Prompt again.*

That is not **Agentic Engineering**. Real agentic engineering builds a rigorous system harness around the model:
1. **Harness Engineering**: Giving the agent deterministic tools, session lineage, and execution hooks.
2. **Epistemic Planning**: Gating code modification behind formal requirements and independent review (`pi-quest`).
3. **Memory Engineering**: Giving agents a persistent, cross-session second brain (`pi-mm`).
4. **Deterministic Compaction**: Lossless, zero-LLM context extraction that survives long tasks (`pi-vcc`).
5. **Multi-Agent Oversight**: Reviewing intent, edge cases, and architectural trade-offs with independent child agents (`pi-subagents` & `/council`).
6. **Non-Blocking Execution**: Keeping the terminal live while builds, soak tests, and delegates run asynchronously (`pi-background-tasks`).
7. **Automated Verification**: Never trusting code until real tests, compiler passes, and quality gates pass.

If you believe software engineering is about building autonomous systems that plan, verify, and ship code rather than manually typing prompts all day, this stack is for you.

---

## 1. Fast Setup (Copy-Paste)

Run this in your terminal:

```bash
# 1. Install Pi CLI globally (Node 22.19+ required)
npm install -g @earendil-works/pi-coding-agent

# 2. Download our pre-configured settings.json
mkdir -p ~/.pi/agent
curl -fsSL https://raw.githubusercontent.com/tty-pt/site/main/external/pi-instruct/settings.json -o ~/.pi/agent/settings.json

# 3. Start Pi — all extensions are automatically installed on launch!
pi
```

*Or, if you already have this repository cloned locally:*

```bash
mkdir -p ~/.pi/agent
cp external/pi-instruct/settings.json ~/.pi/agent/settings.json
pi
```

*(You can inspect the full configuration file directly in [settings.json](settings.json)).*

---

## 2. Authenticate Provider

In the Pi prompt, sign in with your Google account to get zero-cost access to **Gemini 3.8 Flash** and **Gemini 2.5 Pro**:

```text
/login antigravity
```

*(Or use `/login anthropic` or `/login openai` if you prefer Claude or GPT).*

---

## 3. The Extension Stack & Official Documentation

Each extension is maintained independently. Refer to their official documentation for full API and configuration options:

| Extension | Purpose | Official Upstream Documentation |
| :--- | :--- | :--- |
| **`@tty-pt/pi-quest`** | Epistemic workflow: locks code edits until a plan passes adversarial review, then validates with tests. | [GitHub Repository](https://github.com/tty-pt/pi-quest) |
| **`@tty-pt/pi-mm`** | Persistent cross-session memory mipmaps (`libcorm` C DB + vector search) that survive restarts. | [GitHub Repository](https://github.com/tty-pt/pi-mm) |
| **`pi-vcc`** | Zero-LLM algorithmic conversation compactor. Fast, lossless context preservation + `vcc_recall` history tool. | [GitHub Repository](https://github.com/buihongduc132/pi-vcc) |
| **`pi-subagents`** | Multi-agent delegation (`scout`, `reviewer`, `oracle`, `worker`, `/council`). | [GitHub Repository](https://github.com/nicobailon/pi-subagents) |
| **`pi-background-tasks`** | Non-blocking background shell jobs (`bg_run`), inspect-only delegates, and 5-model Fusion. | [GitHub Repository](https://github.com/ismailsaleekh/pi-background-tasks) |
| **`pi-web-access`** | Real-time web search (Exa, Brave, SearXNG), markdown page fetching, and citation checking. | [GitHub Repository](https://github.com/nicobailon/pi-web-access) |
| **`@juicesharp/rpiv-todo`** | Live persistent task HUD overlay rendered directly in the terminal above your prompt. | [GitHub Repository](https://github.com/juicesharp/rpiv-mono/tree/main/packages/rpiv-todo) |
| **`pi-antigravity`** | Personal Google Cloud Code Assist provider with automatic account rotation on rate limits. | [GitHub Repository](https://github.com/Rahularya01/pi-antigravity) |
| **`pi-cbm`** | Bridges `codebase-memory-mcp` AST knowledge graph as native Pi tools (`search_graph`, `trace_path`). | [GitHub Repository](https://github.com/DeusData/codebase-memory-mcp) |

---

## 4. Optional Power-Up: Local Neural Daemon with axil-auren

Both `pi-mm` (long-term memory evaluation) and `pi-quest` (intent detection) are pre-configured to talk to a local neural daemon on `http://127.0.0.1:4242`.

Running **[axil-auren](https://github.com/tty-pt/auren)** locally gives you private, zero-latency local decisions and dense 384-dimensional vector embeddings without sending data to external APIs or spending a single token:

```bash
# 1. Download two fast, lightweight GGUF models (~530 MB total)
mkdir -p ~/.models
curl -L -o ~/.models/qwen2.5-0.5b-instruct.gguf \
  https://huggingface.co/Qwen/Qwen2.5-0.5B-Instruct-GGUF/resolve/main/qwen2.5-0.5b-instruct-q4_k_m.gguf
curl -L -o ~/.models/bge-small-en-v1.5.gguf \
  https://huggingface.co/CompendiumLabs/bge-small-en-v1.5-gguf/resolve/main/bge-small-en-v1.5-q8_0.gguf

# 2. Launch axil-auren daemon on port 4242
# (See https://github.com/tty-pt/auren for building libaxil-auren from source)
AUREN_JUDGE_MODEL="qwen" \
AUREN_JUDGE_PATH=~/.models/qwen2.5-0.5b-instruct.gguf \
AUREN_EMBED_MODEL="bge-small" \
AUREN_EMBED_PATH=~/.models/bge-small-en-v1.5.gguf \
axil -A -d -p 4242 -m $HOME/auren/lib/libaxil-auren
```

*Note: If `axil-auren` is not running, both `pi-mm` and `pi-quest` automatically fail open to local heuristics without crashing.*

---

## 5. Enable in a Project (`AGENTS.md`)

Pi reads instructions from `AGENTS.md` in your repository root. To enforce plan gating, TDD, and task tracking, copy our starter template:

```bash
cp external/pi-instruct/templates/AGENTS.md ./AGENTS.md
```

---

## 6. Keyboard Cheat Sheet

| Key | Action |
| :--- | :--- |
| `Ctrl + Q` | Open the active **Quest Plan** viewer (`pi-quest`) |
| `Shift + Down` | Open the **Background Tasks Dock** (`pi-background-tasks`) |
| `Ctrl + Shift + T` | Toggle the **Todo Overlay Panel** (`rpiv-todo`) |
| `Ctrl + C` | Cancel active generation or running tool |
| `Ctrl + D` | Exit Pi session |
