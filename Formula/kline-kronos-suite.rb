class KlineKronosSuite < Formula
  desc "Deterministic intraday OHLCV cleaning, 1m->5m resampling, and QA CLI for Kronos"
  homepage "https://github.com/Ziqi/KLine-Kronos-Suite"
  url "https://github.com/Ziqi/KLine-Kronos-Suite/releases/download/v1.1.0/kline-kronos-suite-v1.1.0.tar.gz"
  sha256 "22e3e8097f7cb22ac235261fbb9c9c544b0eec6d419c8b822c567929bb626245"
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
    output = shell_output("#{bin}/kline-kronos demo")
    assert_match "zero-setup-stdlib-demo", output
  end
end
