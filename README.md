# Ziqi Official Homebrew Tap (`Ziqi/tap`)

[![Tap CI](https://github.com/Ziqi/homebrew-tap/actions/workflows/ci.yml/badge.svg)](https://github.com/Ziqi/homebrew-tap/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](./LICENSE)

Official **Homebrew** (macOS & Linuxbrew) tap for zero-dependency open-source network infrastructure, digital forensics (DFIR), BEC incident-triage, and quantitative data engineering toolkits maintained by [`@Ziqi`](https://github.com/Ziqi). Every formula installs directly from bit-for-bit reproducible, Sigstore **SLSA Build Level 3** attested release artifacts.

---

## Quick Install & Usage

```bash
# Tap once (optional — brew install Ziqi/tap/<formula> taps automatically)
brew tap Ziqi/tap

# 1. StarHub Kit — AI Agent sandbox firewalls (nftables/pf/Tailscale ACL), Sing-box/Mihomo & MCP server
brew install Ziqi/tap/starhub-kit
starhub render --profile ai-sandbox --target all --dry-run
starhub audit
# Note: when writing rendered bundles to disk, pass --out-dir ./dist

# 2. StarShield Forensics — Offline Chromium/Electron LevelDB carver, container inspector & read-only MCP CLI
brew install Ziqi/tap/starshield-forensics
starshield demo
starshield mcp

# 3. ClearLens — Zero-backend BEC/wire-fraud triage workbench, outbound DLP & multi-currency recall ledger
brew install Ziqi/tap/clearlens
clearlens demo

# 4. KLine Kronos Suite — Multi-market (US/Crypto/HK/CN) OHLCV cleaner, leakage auditor & MCP CLI
brew install Ziqi/tap/kline-kronos-suite
kline-kronos demo

# 5. DiffQuorum — Blind peer anti-fake-quorum verifier, <400B pointer blackboard, modal-safe wake & 0-token preflight
brew install Ziqi/tap/diffquorum
diffquorum init --root /tmp/dq-demo && diffquorum preflight --root /tmp/dq-demo --cli python3 && diffquorum doctor --root /tmp/dq-demo
# Backward-compatibility alias (`starcouncil`) is also available via `brew install Ziqi/tap/starcouncil`
```

---

## Available Formulas

| Formula | Purpose | Upstream & Version | Supply-Chain Provenance |
| :--- | :--- | :--- | :--- |
| **`starhub-kit`** | AI Agent sandbox firewall (`nftables`, `macOS pf`, `Tailscale ACL`), `Sing-box`/`Mihomo` QUIC routing, security auditor, and native `MCP` server | [`Ziqi/starhub-kit`](https://github.com/Ziqi/starhub-kit) (`v1.3.0`) | OpenSSF Silver `#16658` · SLSA L3 · Ed25519 `.sig` · SWHID `swh:1:snp:0a98e8ee` |
| **`starshield-forensics`** | Offline Chromium/Electron LevelDB `.log` carver, PNG/JPEG/PDF container inspector, financial checksum validator, and read-only `MCP` server | [`Ziqi/starshield-forensics`](https://github.com/Ziqi/starshield-forensics) (`v0.3.11`) | OpenSSF Silver `#16602` · PyPI PEP 740 · SLSA L3 · Zenodo `10.5281/zenodo.24145804` |
| **`clearlens`** | Zero-backend BEC, wire fraud & digital coercion triage workbench with outbound DLP guardrails, multi-currency FX stripping, and offline CSP web app | [`Ziqi/clearlens`](https://github.com/Ziqi/clearlens) (`v1.0.0`) | OpenSSF Silver `#16718` · SLSA L3 · REUSE 3.3 · Offline CSP (`default-src 'none'`) · SWHID `swh:1:snp:3f624661` |
| **`kline-kronos-suite`** | Multi-market (`US`/`Crypto`/`HK`/`CN`) intraday OHLCV cleaner, look-ahead leakage auditor, JSONL window exporter, and native `MCP` server | [`Ziqi/KLine-Kronos-Suite`](https://github.com/Ziqi/KLine-Kronos-Suite) (`v1.2.0`) | OpenSSF Silver `#16679` · SLSA L3 · Ed25519 `.sig` · SWHID `swh:1:snp:d3ac3e0d` |
| **`diffquorum`** (`starcouncil` alias) | `<400B` pointer blackboard, Stage-2 blind `Peer A/B/C` anti-fake-quorum verifier, modal-safe 6-gate idle wakeup & `<1s` zero-token `preflight` | [`Ziqi/diffquorum`](https://github.com/Ziqi/diffquorum) (`v0.2.0`) | OpenSSF Silver `#16755` · SLSA L3 · Ed25519 `.sig` · SWHID `swh:1:snp:8ebe52ea` |

---

## License

MIT License. See [`LICENSE`](./LICENSE).
