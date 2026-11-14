class StarshieldForensics < Formula
  desc "Offline Chromium LevelDB carver, screenshot ICC inspector, and MCP CLI"
  homepage "https://ziqi.github.io/starshield/"
  url "https://files.pythonhosted.org/packages/e2/21/8243e23c9008f5f2a74c8f22435fbc8dc17378d576939b163b24aed4da29/starshield_forensics-0.3.8.tar.gz"
  sha256 "87afc0617eedd5a760a5ddfb7ab5ba002dc930ff25db7ad7cd2d8bd115e19325"
  license "MIT"

  depends_on "python@3.12"

  def install
    libexec.mkpath
    system "cp", "-R", ".", libexec
    (bin/"starshield").write <<~EOS
      #!/bin/bash
      set -euo pipefail
      export PYTHONPATH="#{libexec}${PYTHONPATH:+:$PYTHONPATH}"
      exec "#{Formula["python@3.12"].opt_bin}/python3.12" -m starshield.cli "$@"
    EOS
    chmod 0755, bin/"starshield"
  end

  test do
    output = shell_output("#{bin}/starshield demo")
    assert_match "starshield-forensics/0.3.8", output
    mcp_out = pipe_output("#{bin}/starshield mcp", '{"jsonrpc":"2.0","id":1,"method":"tools/list"}' + "\n")
    assert_match "starshield_demo", mcp_out
  end
end
