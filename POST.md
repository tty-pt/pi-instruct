# LinkedIn / Social Post Draft

---

The biggest problem with AI coding agents isn't raw intelligence—it's **chronic amnesia, token waste, and the rush-to-edit anti-pattern**.

Every session starts from scratch. You spend 45 minutes on a Tuesday diagnosing an obscure linker flag or concurrency race, only to watch the agent make the exact same blunder two weeks later because the context window was wiped clean. And when given a non-trivial prompt, typical agents start blindly hacking files before they've even understood the architecture.

I wanted an autonomous software engineer whose knowledge **actually compounds over weeks and months**, plans rigorously before touching code, and runs with zero token waste.

So I engineered a pure-C memory, code intelligence, and epistemic planning harness on top of [Pi Coding Agent](https://github.com/earendil-works/pi-coding-agent):

### 🛡️ 1. Epistemic Plan Gating (`pi-quest`)
Eliminates blind edits and hallucinated fixes. File-writing tools remain hard-locked while the agent investigates the codebase, gathers file-backed citations, and drafts an actionable plan. The plan must pass an independent adversarial subagent review before implementation begins. Furthermore, completion is gated behind real automated test executions—no claiming victory on unverified code.

### 🧠 2. Unified Pure-C Code Intelligence & Persistent Memory (`pi-mm`)
Instead of bloated LSPs or slow grep pipelines, **[pi-mm](https://github.com/tty-pt/pi-mm)** unifies AST symbol navigation, call graph tracing, git diff blast radius analysis, and persistent episodic memory in pure C ([libcorm](https://github.com/tty-pt/libcorm), [libsepal](https://github.com/tty-pt/libsepal), [liblemma](https://github.com/tty-pt/liblemma), [libislet](https://github.com/tty-pt/libislet)). It organizes project lore into multi-resolution **Memory Mipmaps** (L0 execution logs → L1 task summaries → L2 subsystem invariants → L3 architectural principles). An architectural rule learned three weeks ago is quietly recalled before your prompt even touches the model.

### ⚡ 3. Sub-5ms Reflex Decisions (Zero Tokens, Zero Cost)
Instead of invoking heavy generative LLMs to ask *"should I remember this?"* or *"is this a bug report?"*, **[axil-auren](https://github.com/tty-pt/axil-auren)** runs an in-memory System 1 reflex engine on port 4242. Using SIMD cosine dot products in C against pre-computed exemplar vectors, it classifies intents and evaluates reflex decisions in **~5 milliseconds** with **0 decode tokens** and **$0 API cost**.

### ⚙️ 4. Algorithmic Zero-LLM Compaction & Non-Blocking Async Tasks
- **Zero-LLM Compaction (`pi-vcc`)**: Compresses massive session transcripts algorithmically without fuzzy summaries, lost decisions, or token-burning hallucinations.
- **Non-Blocking Background Tasks (`bg_run`)**: Compiles, watchers, and test suites run asynchronously without locking the terminal event loop, waking the agent reactively on completion.
- **Pure-C Footprint**: Microsecond vector indexing and diacritic-sensitive search (`pão ≠ pao`) run locally on CPU RAM in ~250 MB.

---

The result is an agent that gets **measurably smarter, faster, and more disciplined the longer you work with it**—with zero manual configuration out of the box.

👉 **Quickstart & Setup (`pi-instruct`)**: https://github.com/tty-pt/pi-instruct  
(or https://lnkd.in/eWbChu_5)

Repositories:
📦 **pi-quest**: https://github.com/tty-pt/pi-quest  
📦 **pi-mm**: https://github.com/tty-pt/pi-mm  
⚡ **axil-auren**: https://github.com/tty-pt/axil-auren  

---

#SoftwareEngineering #SystemsProgramming #AI #CodingAgents #OpenSource #DevTools #Terminal #BuildInPublic
