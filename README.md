# Summaries Workflow
This folder is set up for generating LaTeX summaries of math/statistics concepts relevant to quantitative finance.

Quick start
1. `cd ./Summaries`
2. Start Codex.
3. Ask for a concept, for example:
   - "Create a summary for Hidden Markov Models with a focus on regime detection."
   - "Summarize stochastic volatility models for systematic strategies."

What the agent does
- Asks clarifying questions one at a time until the concept and focus are clear.
- Creates a new concept folder under `Summaries/Output/` with Title_Case naming.
- Uses `SUMMARY_TEMPLATE.tex` to keep the exact section layout.
- Writes a concrete "General Idea" (what, why, when) and an in-depth "Intuition" section.
- Adds a short "Prerequisite concepts" line after the title.
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
- Change the domain rules and tone in `Summaries/AGENTS.md`.
- Update the layout and placeholders in `Summaries/SUMMARY_TEMPLATE.tex`.
- Add or remove sections to match your target field.
- If you want data/tool integrations, document them in `Summaries/AGENTS.md` and call them out in your prompts.

Example: switching to molecular biology (high level)
- In `Summaries/AGENTS.md`, replace quant-finance usage requirements with biology use cases (e.g., pathway analysis, gene expression, protein interactions).
- In `Summaries/SUMMARY_TEMPLATE.tex`, rename the finance section to a biology-focused section (e.g., "Usage in Molecular Biology") and update the "Typical applications" bullets.
- Add a short note in `Summaries/AGENTS.md` about preferred references or databases (e.g., PubMed for literature, UniProt for proteins, KEGG/Reactome for pathways).
