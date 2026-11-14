class KlineKronosSuite < Formula
  desc "Multi-market OHLCV cleaner, leakage auditor, JSONL exporter, and MCP CLI"
  homepage "https://github.com/Ziqi/KLine-Kronos-Suite"
  url "https://github.com/Ziqi/KLine-Kronos-Suite/releases/download/v1.2.0/kline-kronos-suite-v1.2.0.tar.gz"
  sha256 "87dd4909f41b01a422ac8865525b692a209d17eb2ba731867a1dd80c3f5bd251"
  license "MIT"

  depends_on "python@3.12"

  def install
    libexec.mkpath
    system "cp", "-R", ".", libexec
    (bin/"kline-kronos").write <<~EOS
      #!/bin/bash
      set -euo pipefail
      export PYTHONPATH="#{libexec}${PYTHONPATH:+:$PYTHONPATH}"
      exec "#{Formula["python@3.12"].opt_bin}/python3.12" -m kline_kronos "$@"
    EOS
    chmod 0755, bin/"kline-kronos"
  end

  test do
    output = shell_output("#{bin}/kline-kronos demo --market us")
    assert_match "zero-setup-stdlib-demo", output
  end
end
