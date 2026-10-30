# LinkedIn / Social Post Draft

---

The biggest problem with AI coding agents isn't raw intelligence—it's **chronic amnesia and token waste**.

Every session starts from scratch. You spend 45 minutes on a Tuesday diagnosing an obscure linker flag or concurrency race, only to watch the agent make the exact same blunder two weeks later because the context window was wiped clean. And if you try to make agents "think" about what to remember with generative prompts, you freeze the terminal and burn thousands of tokens every single turn.

I wanted an autonomous software engineer whose knowledge **actually compounds over weeks and months**, with zero token waste. 

So I engineered this pure-C memory and planning harness on top of [Pi Coding Agent](https://github.com/earendil-works/pi-coding-agent):

### ⚡ 1. Sub-5ms Reflex Decisions (Zero Tokens, Zero Cost)
Instead of invoking heavy generative LLMs to ask *"should I remember this?"* or *"is this a bug report?"*, **[axil-auren](https://github.com/tty-pt/axil-auren)** runs an in-memory System 1 reflex engine on port 4242. Using SIMD cosine dot products in C against pre-computed exemplar vectors, it classifies intents and evaluates memory decisions in **~5 milliseconds** with **0 decode tokens** and **$0 API cost**.

### 🧠 2. Persistent Memory That Lasts for Weeks
**[pi-mm](https://github.com/tty-pt/pi-mm)** gives the agent long-term memory that survives restarts and context compactions indefinitely. Built on a compiled C engine ([libcorm](https://github.com/tty-pt/libcorm)) and vector search ([libsepal](https://github.com/tty-pt/libsepal)), it organizes knowledge into hierarchical **Memory Mipmaps** (L0 execution logs → L1 tasks → L2 subsystem invariants → L3 principles). An architectural rule learned three weeks ago is quietly recalled before your prompt even touches the model.

### 🛡️ 3. Epistemic Plan Gating Before Touching Code
**[pi-quest](https://github.com/tty-pt/pi-quest)** eliminates the "rush-to-edit" habit. It locks file editing tools until the agent scouts the codebase, cites file-backed evidence, and passes an independent adversarial subagent review. Diffs must be proven against real test commands before victory is declared.

### ⚙️ 4. Extreme Efficiency Across the Entire Stack
- **Zero-LLM Compaction (`pi-vcc`)**: Compresses massive session transcripts algorithmically without fuzzy summaries or token-burning hallucinations.
- **Non-Blocking Background Tasks (`bg_run`)**: Compiles and test suites run asynchronously without locking the terminal event loop.
- **Pure-C Speed**: Microsecond vector indexing and diacritic-sensitive search (`pão ≠ pao`) run entirely on local CPU RAM (~250 MB footprint).

---

The result is an agent that gets **measurably smarter and faster the longer you work with it**.

The entire stack is open-source and pre-configured to work out of the box with zero manual settings:

👉 **Quickstart & Setup (`pi-instruct`)**: https://github.com/tty-pt/pi-instruct  
(or https://lnkd.in/eWbChu_5)

Repositories:
📦 **pi-mm**: https://github.com/tty-pt/pi-mm  
📦 **pi-quest**: https://github.com/tty-pt/pi-quest  
⚡ **axil-auren**: https://github.com/tty-pt/axil-auren

---

#SoftwareEngineering #SystemsProgramming #AI #CodingAgents #OpenSource #DevTools #Terminal #BuildInPublic
