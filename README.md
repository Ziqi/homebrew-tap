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

# 2. StarShield Forensics — Offline Chromium/Electron LevelDB carver, screenshot ICC inspector & MCP CLI
brew install Ziqi/tap/starshield-forensics
starshield demo
starshield mcp

# 3. ClearLens — Zero-backend BEC/wire-fraud triage workbench, outbound DLP & multi-currency recall ledger
brew install Ziqi/tap/clearlens
clearlens demo

# 4. KLine Kronos Suite — Multi-market (US/Crypto/HK/CN) OHLCV cleaner, leakage auditor & MCP CLI
brew install Ziqi/tap/kline-kronos-suite
kline-kronos demo

# 5. StarCouncil — Pointer-Over-Blackboard orchestration, anti-fake-council verifier & 6-gate wakeup CLI
brew install Ziqi/tap/starcouncil
starcouncil init --root /tmp/sc-demo && starcouncil doctor --root /tmp/sc-demo
```

---

## Available Formulas

| Formula | Purpose | Upstream & Version | Supply-Chain Provenance |
| :--- | :--- | :--- | :--- |
| **`starhub-kit`** | AI Agent sandbox firewall (`nftables`, `macOS pf`, `Tailscale ACL`), `Sing-box`/`Mihomo` QUIC routing, security auditor, and native `MCP` server | [`Ziqi/starhub-kit`](https://github.com/Ziqi/starhub-kit) (`v1.3.0`) | OpenSSF Silver `#16658` · SLSA L3 · Ed25519 `.sig` · SWHID `swh:1:snp:0a98e8ee` |
| **`starshield-forensics`** | Offline Chromium/Electron LevelDB `.log` carver, PNG/JPEG screenshot ICC inspector, financial checksum validator, and native `MCP` server | [`Ziqi/starshield-forensics`](https://github.com/Ziqi/starshield-forensics) (`v0.3.8`) | OpenSSF Silver `#16602` · PyPI PEP 740 · SLSA L3 · Zenodo `10.5281/zenodo.24145804` |
| **`clearlens`** | Zero-backend BEC, wire fraud & digital coercion triage workbench with outbound DLP guardrails, multi-currency FX stripping, and offline CSP web app | [`Ziqi/clearlens`](https://github.com/Ziqi/clearlens) (`v1.0.0`) | OpenSSF Silver `#16718` · SLSA L3 · REUSE 3.3 · Offline CSP (`default-src 'none'`) · SWHID `swh:1:snp:3f624661` |
| **`kline-kronos-suite`** | Multi-market (`US`/`Crypto`/`HK`/`CN`) intraday OHLCV cleaner, look-ahead leakage auditor, JSONL window exporter, and native `MCP` server | [`Ziqi/KLine-Kronos-Suite`](https://github.com/Ziqi/KLine-Kronos-Suite) (`v1.2.0`) | OpenSSF Silver `#16679` · SLSA L3 · Ed25519 `.sig` · SWHID `swh:1:snp:d3ac3e0d` |
| **`starcouncil`** | Pointer-Over-Blackboard orchestration (`BOARD.md <3KB` / `<400B`), SHA-256 anti-fake-council verifier, 6-gate idle wakeup & tiered review CLI | [`Ziqi/starcouncil`](https://github.com/Ziqi/starcouncil) (`v0.1.1`) | OpenSSF Silver `#16755` · SLSA L3 · Ed25519 `.sig` · SWHID `swh:1:snp:8ebe52ea` |

---

## License

MIT License. See [`LICENSE`](./LICENSE).
