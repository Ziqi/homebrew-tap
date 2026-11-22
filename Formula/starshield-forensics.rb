class StarshieldForensics < Formula
  desc "Offline Chromium LevelDB carver, container inspector, and read-only MCP CLI"
  homepage "https://ziqi.github.io/starshield/"
  url "https://files.pythonhosted.org/packages/f9/f5/ab87e7fc798c4aa36548fc67baea1252faa3295c2f5ad554173915124937/starshield_forensics-0.3.10.tar.gz"
  sha256 "69e08913a6889916ff47cd05688541d3c276b3f0cdbfdea79f90ce3bf4f047d2"
  license "MIT"

  depends_on "python@3.12"

  def install
    libexec.install "starshield", "LICENSE"
    (bin/"starshield").write <<~EOS
      #!/bin/bash
      set -euo pipefail
      export PYTHONPATH="#{libexec}"
      exec "#{Formula["python@3.12"].opt_bin}/python3.12" -P -m starshield.cli "$@"
    EOS
    chmod 0755, bin/"starshield"
  end

  test do
    output = shell_output("#{bin}/starshield demo")
    assert_match "starshield-forensics/0.3.10", output
    mcp_out = pipe_output("#{bin}/starshield mcp", '{"jsonrpc":"2.0","id":1,"method":"tools/list"}' + "\n")
    assert_match "starshield_demo", mcp_out

    (testpath/"starshield").mkpath
    (testpath/"starshield/__init__.py").write "raise RuntimeError('SHADOW_HIJACK')\n"
    (testpath/"starshield/cli.py").write "raise RuntimeError('SHADOW_HIJACK')\n"
    safe_out = Dir.chdir(testpath) { shell_output("#{bin}/starshield demo") }
    assert_match "starshield-forensics/0.3.10", safe_out
  end
end
