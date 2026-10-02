# Registered Apprenticeship Sponsor Operations

Track work-process hours, related instruction, mentor attestations, wage progression and completion evidence.

## Implemented records

- **Apprenticeship Program**: name, registration Number, occupation, sponsor, start At, completion Hours, status.
- **Apprentice**: name, apprentice Number, employer, started At, mentor, target End At, status.
- **Work Process**: title, code, required Hours, description, sequence, status.
- **Work Hour Entry**: title, worked At, hours, supervisor, status.
- **Instruction Course**: title, provider, required Hours, topic, scheduled At, status.
- **Instruction Attendance**: title, attended At, hours, evidence, status.
- **Mentor Attestation**: title, mentor, competency, evidence, attested At, status.
- **Wage Step**: title, hours Threshold, required Rate Cents, effective At, agreement Version, status.
- **Completion Packet**: title, compiled At, sponsor Notes, supporting Evidence, receipt, status.
- **Operational Task**: title, owner, priority, start At, due At, done, notes, status.
- **Rule Version**: title, jurisdiction, version, effective At, expires At, source Url, requirement Text, status.
- **Document Requirement**: title, category, required By, source Reference, evidence Reference, review Notes, status.

## AI workflows

- Training evidence mapping: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Work-process gap summary: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Mentor review preparation: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Wage progression brief: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Instruction plan draft: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Completion packet narrative: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Evidence completeness review: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Operations handoff draft: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.

## Calculations

- Apprenticeship hour completion: Compute remaining hours and completion against provided program requirements; sponsor authorization is separate.
- Apprenticeship Program evidence checklist: Check source presence against an explicitly supplied document list; reviewer assesses adequacy.
- Operational deadline queue: Compute overdue items from entered dates and completed flags; no external notifications.

## Workspace features

Role-based login and account management; validated create/edit/delete; required parent and sibling relationships; search and pagination; atomic JSON imports; CSV/JSON exports; optimistic concurrency; two independent human reviews; immutable source-text uploads with independent review; dated task calendar; aggregate reports; searchable audit trail; model catalog and administrator AI settings; configured HTTPS connectors with approval, idempotency and receipt checks.

## Integration boundaries

A finite working scope, not every conceivable feature. No production regulator, insurer, carrier, court, university or clinical integration is preconfigured. Source uploads support text/CSV/JSON/Markdown, not OCR/PDF parsing. AI produces drafts and cannot authorize clinical handling, adjudicate rights, select recipients or jurors, establish eligibility, certify regulatory compliance or send submissions. Live external execution requires a configured adapter and independent human approval of the current record. Calculations use supplied rules and units; example rules are fictional.
