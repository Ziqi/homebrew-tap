class StarshieldForensics < Formula
  desc "Offline Chromium LevelDB carver, container inspector, and read-only MCP CLI"
  homepage "https://ziqi.github.io/starshield/"
  url "https://files.pythonhosted.org/packages/07/6a/2c1621721918514f08a92ac3f1ab6556710e07eb9d523e1f4f60beb7d212/starshield_forensics-0.3.9.tar.gz"
  sha256 "a8323a79c4a22bc4f5835423b1c0559164a073c4876345753c15a2de80caa127"
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
    assert_match "starshield-forensics/0.3.9", output
    mcp_out = pipe_output("#{bin}/starshield mcp", '{"jsonrpc":"2.0","id":1,"method":"tools/list"}' + "\n")
    assert_match "starshield_demo", mcp_out
  end
end
