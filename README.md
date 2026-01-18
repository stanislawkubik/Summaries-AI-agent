# Summaries Workflow
This folder is set up for generating LaTeX teaching notes for technical concepts (math, statistics, ML, CS).

* **IMPORTANT:** This project is a work in progress. Suggestions and pull requests are welcome.

Quick start
1. `cd ./Summaries`
2. Start Codex.
3. Ask for a concept, for example:
   - "Create a summary for Hidden Markov Models at an advanced undergraduate level."
   - "Summarize stochastic gradient descent with a focus on optimization intuition."

What the agent does
- Asks clarifying questions only when needed to choose scope, audience level, or focus.
- Creates a new concept folder under `Summaries/Output/` with Title_Case naming.
- Uses `SUMMARY_TEMPLATE.tex` to keep the exact section layout and front matter.
- Writes intuition before formalism and includes a key results map with derivation pointers.
- Includes an Applications section only if the user requests a domain or context.
- Renders a PDF and removes all LaTeX byproducts, leaving only `.tex` and `.pdf`.

File conventions
- Folder: `Summaries/Output/<Concept_Name>/`
- LaTeX: `Summaries/Output/<Concept_Name>/<concept_name>.tex`
- PDF: `Summaries/Output/<Concept_Name>/<concept_name>.pdf`

Notes
- The template is at `Summaries/SUMMARY_TEMPLATE.tex`.
- If `pdflatex` is not on PATH, the agent uses:
  `~/Library/TinyTeX/bin/universal-darwin/pdflatex`
- Cleanup script: `Summaries/clean_latex.sh`
  - From a summary folder: `../../clean_latex.sh .`
  - From `Summaries/`: `./clean_latex.sh Output/<Concept_Name>`
- Optional Makefile helpers (run from `Summaries/`):
  - `make build FILE=Output/<Concept_Name>/<concept_name>.tex`
  - `make clean DIR=Output/<Concept_Name>`

Adapting the agent (high level)
- Change structure and writing rules in `Summaries/AGENTS.md`.
- Update layout and placeholders in `Summaries/SUMMARY_TEMPLATE.tex`.
- If you want domain-specific Applications content, request it in your prompt; the template includes an optional Applications section.
- If you want data/tool integrations, document them in `Summaries/AGENTS.md` and call them out in your prompts.

## Codex CLI settings requirements

To run this project correctly, Codex CLI must be configured with permissions that allow it to modify the repository and execute the build workflow.

### 1. Required for the core workflow

The following capabilities are mandatory for the agent to function as designed:

- **Sandbox write access to the repository**
  - Codex must be able to create and modify files inside the current workspace.
  - This is required to generate new directories under `Summaries/Output/`, create `.tex` files, and update existing summaries.

- **Permission to execute local commands**
  - The agent needs to run build commands such as:
    - `pdflatex`
    - `make build`
    - `clean_latex.sh`
  - These are necessary to compile the LaTeX summary into a PDF and clean temporary files.

- **Working LaTeX installation**
  - `pdflatex` must be available on the system PATH.
  - If not globally installed, the TinyTeX path specified in the README Notes section must be valid.

Without these permissions, Codex will not be able to produce the final formatted summaries.

---

### 2. Required: web search for grounded references

Summaries require real, verifiable references. Enable the built in web search tool so the agent can use `web.run` to find and verify sources.

Enable via one of the following:

**Temporary for a single session**
- Run Codex with:
  - `codex --search`

**Permanent configuration**
- Add to `~/.codex/config.toml`:

  [features]
  web_search_request = true

This allows the agent to discover relevant papers, arXiv links, and citations when generating summaries.

---

### 3. Optional: full internet access for automated paper retrieval

If you want Codex not only to search for papers but also to download PDFs or query external APIs directly, full network access must be enabled in the sandbox.

Add to `~/.codex/config.toml`:

  [sandbox_workspace_write]
  network_access = true

This is only necessary if you intend to implement workflows where Codex:

- downloads papers automatically
- extracts text from PDFs
- stores verified sources inside the repository

For basic usage, enabling web search alone is sufficient.

---

### Summary of requirements

| Capability | Parameter to set | Needed for |
|---------|-------------------|-----------|
| Workspace write access | Codex CLI sandbox must allow workspace writes (run in a write enabled sandbox mode) | Creating summary files and directories |
| Command execution | Codex CLI must allow running shell commands (approval policy must permit local command execution) | Running LaTeX compilation and cleanup |
| LaTeX installation | `pdflatex` available on PATH (or TinyTeX path configured as per README Notes) | Building PDF outputs |
| Web search tool | `~/.codex/config.toml` -> `[features]` `web_search_request = true` (or run `codex --search`) | Finding and verifying references |
| Full network access | `~/.codex/config.toml` -> `[sandbox_workspace_write]` `network_access = true` | Downloading and parsing papers automatically |


If any of these settings are missing, parts of the workflow will fail or require manual intervention.
