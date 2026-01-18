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
- Before providing any references or citations, first think through the concept and what needs sourcing, then follow the References workflow below.
- All cited items must appear in the bibliography.

References workflow
- Detect MCP availability early in the run by attempting each tool at least once:
  - Semantic Scholar MCP: search for the exact technique name.
  - Crossref MCP: lookup or search for one candidate title or DOI.
  - arXiv MCP: search for the technique name.
- If all three MCP tool families are callable without error, treat MCP as available for the run and use the MCP + web workflow.
- If any are not callable or error, treat MCP as unavailable and use the web search only workflow.

MCP + web workflow (minimize irrelevant citations)
- Query expansion: build 5 to 10 queries including the technique name, common aliases, and tutorial/survey/lecture notes/derivation plus key related terms.
- Candidate retrieval:
  - Semantic Scholar MCP: top candidates per query.
  - Crossref MCP: metadata candidates per query.
  - arXiv MCP: arXiv candidates per query.
- Canonicalize and deduplicate:
  - Prefer DOI as the primary identifier; if no DOI, use arXiv id.
  - Deduplicate across sources by DOI or arXiv id, otherwise normalized title + first author + year.
- Verification gate:
  - Include a paper in the bibliography only if it has a stable identifier (DOI or arXiv id).
  - Any claim of the form "Paper X uses method Y" must be supported by an abstract that explicitly states it, or full text when available via arXiv MCP.
  - If verification fails, do not cite as evidence; it may appear only in Further reading if the title is unambiguous and the identifier is stable.
- Use web search (web.run) as a second view:
  - For the final short list, use web search (web.run) to confirm title, authors, year, and identifier consistency and to find canonical landing pages.
  - If web search contradicts MCP metadata, prefer Crossref for DOI metadata; if still inconsistent, drop the paper.
- Select by buckets, not raw ranking:
  - Foundational/origin paper: 1.
  - Modern tutorial or lecture notes: 1 to 2.
  - Survey or broad reference: 0 to 1.
  - Applied usage papers: 1 to 3 only if they pass the verification gate.
  - Implementation documentation: 1.
- Keep bibliography small: prefer 4 to 8 total citations and avoid extra citations that do not improve learning value.

Web search only workflow (fallback)
- Use web search (web.run) for all discovery and verification.
- Do not cite any paper unless it has a stable identifier (DOI or arXiv id).
- Do not make claims about what a paper does unless the abstract or full text you opened explicitly supports it.

Bibliography discipline
- Never invent DOI, arXiv id, year, venue, or authors.
- Prefer to include DOI and/or arXiv links for every entry.

Build and cleanup
- Compile with `pdflatex` (run twice).
- If `pdflatex` is not on PATH, use:
  `~/Library/TinyTeX/bin/universal-darwin/pdflatex`
- Prefer the cleanup script:
  - From the summary folder: `../../clean_latex.sh .`
  - From `Summaries/`: `./clean_latex.sh Output/<Concept_Name>`
