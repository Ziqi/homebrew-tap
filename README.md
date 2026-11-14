# Ziqi Official Homebrew Tap (`Ziqi/tap`)

[![Tap CI](https://github.com/Ziqi/homebrew-tap/actions/workflows/ci.yml/badge.svg)](https://github.com/Ziqi/homebrew-tap/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](./LICENSE)

Official **Homebrew** (macOS & Linuxbrew) tap for zero-dependency open-source network infrastructure, digital forensics (DFIR), and quantitative data engineering toolkits maintained by [`@Ziqi`](https://github.com/Ziqi). Every formula installs directly from bit-for-bit reproducible, Sigstore **SLSA Build Level 3** attested release tarballs.

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

# 2. StarShield Forensics — Clean-room offline Chromium LevelDB .log carver & DFIR triage CLI
brew install Ziqi/tap/starshield-forensics
starshield demo

# 3. KLine Kronos Suite — Multi-market (US/Crypto/HK/CN) OHLCV cleaner, leakage auditor & MCP CLI
brew install Ziqi/tap/kline-kronos-suite
kline-kronos demo
```

---

## Available Formulas

| Formula | Purpose | Upstream & Version | Supply-Chain Provenance |
| :--- | :--- | :--- | :--- |
| **`starhub-kit`** | AI Agent sandbox firewall (`nftables`, `macOS pf`, `Tailscale ACL`), `Sing-box`/`Mihomo` QUIC routing, security auditor, and native `MCP` server | [`Ziqi/starhub-kit`](https://github.com/Ziqi/starhub-kit) (`v1.3.0`) | OpenSSF Silver `#16658` · SLSA L3 · Ed25519 `.sig` · SWHID `swh:1:snp:e4eeb16e` |
| **`starshield-forensics`** | Clean-room deterministic Chromium LevelDB `.log` carver, PNG/JPEG ICC provenance inspector, and financial checksum validator | [`Ziqi/starshield-forensics`](https://github.com/Ziqi/starshield-forensics) (`v0.3.7`) | OpenSSF Silver `#16602` · PyPI PEP 740 · SLSA L3 · Zenodo `10.5281/zenodo.24145804` |
| **`kline-kronos-suite`** | Multi-market (`US`/`Crypto`/`HK`/`CN`) intraday OHLCV cleaner, look-ahead leakage auditor, JSONL window exporter, and native `MCP` server | [`Ziqi/KLine-Kronos-Suite`](https://github.com/Ziqi/KLine-Kronos-Suite) (`v1.2.0`) | OpenSSF Silver `#16679` · SLSA L3 · Ed25519 `.sig` · SWHID `swh:1:snp:9760a7bf` |

---

## License

MIT License. See [`LICENSE`](./LICENSE).
