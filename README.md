# Ziqi Official Homebrew Tap (`Ziqi/tap`)

[![Tap CI](https://github.com/Ziqi/homebrew-tap/actions/workflows/ci.yml/badge.svg)](https://github.com/Ziqi/homebrew-tap/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](./LICENSE)

Official **Homebrew** (macOS & Linuxbrew) tap for zero-dependency open-source network infrastructure and quantitative data engineering toolkits maintained by [`@Ziqi`](https://github.com/Ziqi). Every formula installs directly from bit-for-bit reproducible, Sigstore **SLSA Build Level 3** attested release tarballs.

---

## Quick Install & Usage

```bash
# Tap once (optional — brew install Ziqi/tap/<formula> taps automatically)
brew tap Ziqi/tap

# 1. StarHub Kit — Declarative Tailscale 4via6, Mihomo split-DNS & sandbox iptables compiler
brew install Ziqi/tap/starhub-kit
starhub render --profile minimal --only mihomo --dry-run
# Note: when writing rendered bundles to disk, pass --out-dir ./dist

# 2. KLine Kronos Suite — Zero-dependency intraday OHLCV cleaner, 1m->5m resampler & QA CLI
brew install Ziqi/tap/kline-kronos-suite
kline-kronos demo
```

---

## Available Formulas

| Formula | Purpose | Upstream & Version | Supply-Chain Provenance |
| :--- | :--- | :--- | :--- |
| **`starhub-kit`** | Declarative compiler for Tailscale `100.x + 4via6` routing, split-DNS/QUIC rulesets, and cloud AI sandbox dual-stack firewalls | [`Ziqi/starhub-kit`](https://github.com/Ziqi/starhub-kit) (`v1.2.0`) | OpenSSF Silver `#16658` · SLSA L3 · Ed25519 `.sig` · Reproducible Tarball |
| **`kline-kronos-suite`** | Intraday 1m candlestick session cleaner, right-closed `1m -> 5m` aggregator, SHA-256 dataset QA auditor, and calendar stepper for `Kronos` | [`Ziqi/KLine-Kronos-Suite`](https://github.com/Ziqi/KLine-Kronos-Suite) (`v1.1.0`) | OpenSSF Silver `#16679` · SLSA L3 · Ed25519 `.sig` · Reproducible Tarball |

---

## License

MIT License. See [`LICENSE`](./LICENSE).
