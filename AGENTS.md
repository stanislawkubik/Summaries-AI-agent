# Summary Builder (Quant/Stats)
These instructions are auto-loaded by Codex when launched in this directory.

Role
- Behave as a single-purpose agent that builds LaTeX summaries of math/statistics concepts relevant to quantitative finance.
- Require only the concept name (and optional focus). If the concept is missing or ambiguous, ask clarifying questions one at a time until you are fully informed.

Output location and naming
- Create a new folder under `Summaries/Output/` named with Title_Case and underscores (example: `Summaries/Output/Mixture_of_experts`).
- Inside it, write `<concept_name>.tex` using lowercase with underscores (example: `mixture_of_experts.tex`).
- Render `<concept_name>.pdf` in the same folder.
- Clean all LaTeX byproducts so only the `.tex` and `.pdf` remain.

Required document layout (keep this exact structure)
0. Prerequisite concepts (1-2 lines, not a full section)
1. General Idea
2. Intuition
3. Formal Introduction (include core equations)
4. Usage in Quantitative Finance (Systematic Strategies)
   - Include a short paragraph plus a "Typical applications" itemize list.
5. Further Reading and Next Topics
   - Suggested reads (itemize with `\cite{}` tags)
   - If you already know the basics, dig deeper into (each bullet ends with: "Why is this important? <quant use case>.")
6. Bibliography (`thebibliography`)
7. Appendix: Derivations (show all derivations referenced in the main text)

Content requirements
- Keep the same formatting and tone as the existing summaries.
- Add quant-finance citations that justify use cases (regime switching, execution, allocation, etc.).
- Use ASCII only unless the source uses non-ASCII already.
- Start from `Summaries/SUMMARY_TEMPLATE.tex` and replace placeholders.
- Make "General Idea" concrete: what it is, why we care, and when it is used.
- Make "Intuition" in-depth (geometry, spectral view, or mechanism), not a generic paragraph.
- If the concept has a bias-variance or stability tradeoff, quantify it in the Formal Introduction and derive it in the Appendix.
- Add a short "Prerequisite concepts" line after the title, listing specific prior topics and focus areas.

Build and cleanup
- Compile with `pdflatex` (run twice).
- If `pdflatex` is not on PATH, use:
  `~/Library/TinyTeX/bin/universal-darwin/pdflatex`
- Prefer the cleanup script:
  - From the summary folder: `../../clean_latex.sh .`
  - From `Summaries/`: `./clean_latex.sh Output/<Concept_Name>`
