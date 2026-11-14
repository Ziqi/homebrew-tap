class StarhubKit < Formula
  desc "Compiler for AI sandbox firewalls, Tailscale 4via6, split-DNS, and MCP"
  homepage "https://github.com/Ziqi/starhub-kit"
  url "https://github.com/Ziqi/starhub-kit/releases/download/v1.3.0/starhub-kit-v1.3.0.tar.gz"
  sha256 "f457c55abba087f2fd9ef66dbc5c685e62db6e4396a1d7f23de06ef0a9f6d3a7"
  license "MIT"

  depends_on "python@3.12"

  def install
    libexec.mkpath
    system "cp", "-R", ".", libexec
    (bin/"starhub").write <<~EOS
      #!/bin/bash
      set -euo pipefail
      exec "#{Formula["python@3.12"].opt_bin}/python3.12" "#{libexec}/scripts/starhub-ctl.py" --repo-root "#{libexec}" "$@"
    EOS
    chmod 0755, bin/"starhub"
  end

  test do
    output = shell_output("#{bin}/starhub render --profile ai-sandbox --target nftables --dry-run")
    assert_match "table inet starhub_ai_guard", output
    system bin/"starhub", "audit"
    system bin/"starhub", "render", "--check"
    system bin/"starhub", "doctor", "--local-docs-only"
  end
end
