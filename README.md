# Bot V7 Trading Lifecycle Lab

Bot V7 is a clean, independent trading-system project that will merge the useful ideas from Horizon v6, the old superbot deployment stack, and the legacy institutional Horizon app without carrying forward their runtime coupling.

The purpose is to build a full bot trading lifecycle platform: market data, signal generation, validation, governance, paper/testnet execution, P&L, learning, audit, and promotion controls.

## Current Phase

Phase 8: live-readiness safety scaffold.

Bot V7 now has deterministic SQLite-backed lifecycle records, fixture market data ingestion, a baseline strategy, signal/governance/paper/P&L/learning paths, a rendered read-only dashboard, local reconciliation checks, and operational service templates.

No live trading logic is implemented. No broker or exchange order code is present. Testnet support is intent-only and performs no network I/O.

## Guiding Principles

- Evidence before activation.
- Paper and testnet before live.
- Every signal, blocker, order, model decision, and outcome must be recorded.
- UI starts as read-only governance and observability.
- Live trading requires explicit future approval and separate implementation.
- Old systems are references, not foundations.

## Team Review Model

Bot V7 uses a five-role review model before implementation work:

- Project Manager: phase schedule, feature migration accountability, release reporting, and traceability from source systems.
- Bot Expert: strategy lifecycle, market data, execution, risk, and learning design.
- UI/UX Expert: control-tower dashboard, operator workflow, safety affordances, and clarity.
- Testing Manager: test strategy, safety regression, schema checks, and release readiness.
- Integration Expert: storage, services, deployment, version control, and phased integration.

See `docs/TEAM_REVIEW_MODEL.md`, `docs/PROJECT_MANAGEMENT.md`, and `docs/FEATURE_MIGRATION_MATRIX.md`.

## Phase Order

See `docs/PHASE_PLAN.md`.

## Schema

Initial schema draft: `schema/001_initial_schema.sql`.

## Read-Only Dashboard

Render a local dashboard HTML file from an existing Bot V7 SQLite database:

```bash
python -m bot_v7.workers dashboard --db state/bot-v7.sqlite --out reports/dashboard.html
```

Run local lifecycle reconciliation against an existing database:

```bash
python -m bot_v7.workers reconcile --db state/bot-v7.sqlite
```

## Local Smoke Test

```bash
python -m unittest discover -s tests
```