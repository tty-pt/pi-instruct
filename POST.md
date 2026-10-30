# LinkedIn / Social Post Draft

---

I got tired of watching AI coding agents fail the same way every day:

- Rushing into code edits without a plan
- Forgetting a bug fix solved two days ago
- Hallucinating during token-heavy compactions
- Freezing the terminal while tests or builds run

Most tools treat AI like an autocomplete widget. I wanted an autonomous software engineer with real discipline. So I engineered my own terminal harness on top of [Pi Coding Agent](https://github.com/earendil-works/pi-coding-agent):

• **[pi-quest](https://github.com/tty-pt/pi-quest)**: Locks code edits behind an epistemic plan gate. The agent must research context, cite evidence, and survive an adversarial review before touching files.

• **[pi-mm](https://github.com/tty-pt/pi-mm)**: Cross-session persistent memory in compiled C ([libcorm](https://github.com/tty-pt/libcorm)) + vector search ([libsepal](https://github.com/tty-pt/libsepal)). Verified learnings and architectural invariants are remembered across sessions.

• **[axil-auren](https://github.com/tty-pt/axil-auren)**: Native C local daemon hosting nearest-exemplar SIMD decision judging and dense embeddings on port 4242—zero tokens, ~5ms latency, $0 cost.

• **The pipeline**: Algorithmic zero-LLM compaction (`pi-vcc`), child subagent reviews (`pi-subagents`), background tasks (`bg_run`), and a live terminal task HUD (`rpiv-todo`).

The result is a self-correcting terminal harness that plans, builds, reviews, and validates autonomously. I open-sourced the entire setup.

You can replicate this exact stack in 60 seconds with one settings file:

👉 **pi-instruct**: https://github.com/tty-pt/pi-instruct  
(or https://lnkd.in/eWbChu_5)

---

#SoftwareEngineering #SystemsProgramming #AI #CodingAgents #OpenSource #DevTools #Terminal #BuildInPublic
