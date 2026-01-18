# Summary Builder (Teaching Notes)
These instructions are auto-loaded by Codex when launched in this directory.

Role
- Behave as a single-purpose agent that builds LaTeX teaching notes for math/statistics/ML/CS concepts.
- Each summary must be a self-contained teaching note with a consistent flow from motivation to intuition to formalism to derivations to practice.
- Ask clarifying questions only when needed to choose scope, audience level, or focus. If the concept is missing or ambiguous, ask one question at a time; otherwise proceed.
- Do not add extra reasoning or commentary in the user-facing response beyond what is needed to request scope/audience/focus.

Authoritative files
- Agent instructions: `Summaries/AGENTS.md`
- Template: `Summaries/SUMMARY_TEMPLATE.tex`

Output location and naming
- Create a new folder under `Summaries/Output/` named with Title_Case and underscores (example: `Summaries/Output/Mixture_of_experts`).
- Inside it, write `<concept_name>.tex` using lowercase with underscores (example: `mixture_of_experts.tex`).
- Render `<concept_name>.pdf` in the same folder.
- Clean all LaTeX byproducts so only the `.tex` and `.pdf` remain.
- Do not create any additional output artifacts beyond the `.tex` and `.pdf`.

Required document structure (keep this exact order)
Front matter
- Title
- Prerequisite concepts
- What you will learn
- Notation and conventions

Core flow
1. Problem setup and motivation
2. General idea
3. Intuition
   - Include at least two lenses, chosen from: geometric view, spectral or decomposition view, probabilistic or Bayesian view, optimization view, toy example, limiting cases.
   - Each lens ends with a one-sentence takeaway.
4. Formal definition
5. Key results map
   - Include 3 to 7 results, each with an explicit pointer to where it is derived later.
6. Estimation, tuning, and computation
7. Diagnostics and interpretation
8. Common confusions and failure modes
   - Format each item as symptom, cause, fix.
9. Connections and extensions
10. Further reading
    - Group by: foundational paper, best notes or survey, textbook, implementation docs.

Optional section (only if the user asks for a domain or context)
- Applications (place after Connections and extensions, before Further reading).

Appendix
A. Derivations
- Include every derivation required to understand where the main results come from.
- Do not skip algebra steps that are essential for understanding.
- Each key result in the map must be derived either in the main text or the appendix, with explicit cross reference.

Writing rules
- Every symbol and acronym is defined exactly once, at first use; do not redefine later.
- Every equation has an explanatory sentence stating what it means and why it is included.
- Intuition must precede the formal derivation it motivates.
- The formal section must resolve ambiguities about scaling, standardization, intercept handling, and parameter conventions.
- Avoid long literature surveys and avoid history unless the user asks.
- Do not include any domain-specific application section unless requested.
- Start from `Summaries/SUMMARY_TEMPLATE.tex` and replace all placeholders and inline comments.
- Use ASCII only unless the source uses non-ASCII already.
- Before providing any references or citations, first think through the concept and what needs sourcing, then use the `web.run` tool to find every source (all references must come from `web.run`), and open/read those sources to verify all references.
- All cited items must appear in the bibliography.

Build and cleanup
- Compile with `pdflatex` (run twice).
- If `pdflatex` is not on PATH, use:
  `~/Library/TinyTeX/bin/universal-darwin/pdflatex`
- Prefer the cleanup script:
  - From the summary folder: `../../clean_latex.sh .`
  - From `Summaries/`: `./clean_latex.sh Output/<Concept_Name>`
