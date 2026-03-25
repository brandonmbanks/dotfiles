---
description: Summarize this session and write it to a local file
allowed-tools:
  - Bash
  - Read
  - Write
  - Glob
  - Grep
---

Write a summary of this conversation session to a file in the current working directory.

**Filename:** `YYYYMMDD <short topic>.md` — use today's date. If a file for today and this topic already exists, update it rather than creating a duplicate.

## Structure

- **H1 title** with ticket/PR context
- **Frontmatter block** with Date, PR, Branch, Jira, Author — include whatever is relevant to the session, skip what isn't
- **Sections** should capture:
  - What was the problem or goal
  - What was done (actions taken, code written, reviews given)
  - Key findings, decisions, and trade-offs
  - Gotchas or dead ends encountered
  - Follow-up actions or linked tickets
- **Link** to PRs, Jira tickets, and specific `file:line` locations where relevant
- Keep it **scannable** — use tables, bullet points, short sentences

## Audience

Future me or a future Claude session picking up this work. Write for someone with full codebase context but no context on this specific session.

## Do NOT

- Rehash code that's in the diff — reference the PR instead
- Include boilerplate or filler
- Summarize things already in the PR description or Jira ticket — reference and link them instead
- Include information that's obvious from the code or git history

## Before writing

1. Review the full conversation to identify what's worth capturing
2. Focus on things that would be **lost** if this conversation disappeared — decisions, context, non-obvious findings, trade-offs
