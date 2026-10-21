# LinkedIn Post Draft

---

I got tired of watching AI coding agents fail the same way every day:

- Jumping straight into editing code before understanding existing conventions.
- Chronic amnesia: fixing an elusive concurrency bug on Tuesday, only to watch the agent repeat the exact same mistake on Thursday.
- Burning thousands of tokens asking LLMs to summarize conversations into blurry hallucinations.
- Freezing my terminal every time a build, soak test, or benchmark runs.

Most tools treat AI like an autocomplete widget. I wanted an autonomous software engineer with genuine discipline.

So I engineered my own terminal harness on top of the open-source **Pi Coding Agent**:

1. **`pi-quest` (Epistemic Plan Gating)**  
I built an epistemic supervisor that locks file editing until the agent produces an approved plan. The agent must scout the problem, cite file-backed evidence, list discrete requirements, and survive an independent adversarial review before touching a single line of code. Once implemented, an independent validator verifies the diff against real tests before declaring victory.

2. **`pi-mm` (Persistent Memory Mipmaps)**  
I built a cross-session memory engine in compiled C (`libcorm`) backed by dense vector search (`libsepal`). Before each turn, it automatically recalls verified bug fixes and architectural invariants. When tasks settle, it saves verified learnings to disk so my agent never repeats past mistakes.

3. **`axil-auren` (Native C Local Neural Daemon)**  
To make memory judging and embeddings lightning-fast without blowing through cloud API quotas, I run `axil-auren` locally on port 4242. It hosts a 0.5B decision judge (Qwen) and dense embeddings (BGE)—delivering private, instant local evaluations at $0 cost and zero external tokens.

4. **The Integrated Pipeline**  
I brought in the best of the Pi ecosystem to complete the machine:
- `pi-vcc`: Pure algorithmic, zero-LLM context compaction (no hallucinations, instant execution).
- `pi-subagents`: Spawns isolated child agents (`scout`, `reviewer`, `oracle`) and runs multi-model `/council` debates.
- `pi-background-tasks`: Non-blocking shell jobs (`bg_run`) that let builds and test suites run in the background without UI freezes.
- `rpiv-todo`: A live, persistent task HUD rendered directly in the terminal above the prompt.
- `pi-cbm`: AST code graph navigation that replaces blind grep searches.
- `pi-antigravity`: Direct Google Cloud Code Assist connection with generous Gemini 3.8 Flash quotas.

---

The result? My terminal feels like a self-correcting engineering lab that plans, builds, reviews, and validates autonomously.

I put together a clean guide so anyone can replicate this exact stack in 60 seconds. You don't even need to install extensions manually—Pi downloads and configures everything automatically from a single `settings.json`:

```bash
# 1. Install Pi CLI globally (Node 22.19+ required)
npm install -g @earendil-works/pi-coding-agent

# 2. Download our pre-configured settings.json
mkdir -p ~/.pi/agent
curl -fsSL https://raw.githubusercontent.com/tty-pt/site/main/external/pi-instruct/settings.json -o ~/.pi/agent/settings.json

# 3. Start Pi — all extensions install automatically on startup!
pi
```

👉 Full setup guide, settings file, and architecture breakdown:  
https://github.com/tty-pt/site/tree/main/external/pi-instruct

If you build real software in terminal environments and want your agents to operate with genuine engineering rigor, give this setup a spin.

---

#SoftwareEngineering #SystemsProgramming #AI #CodingAgents #OpenSource #DevTools #Terminal #BuildInPublic
