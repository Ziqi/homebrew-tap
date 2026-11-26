class StarshieldForensics < Formula
  desc "Offline Chromium LevelDB carver, container structure screener, and read-only MCP CLI"
  homepage "https://ziqi.github.io/starshield/"
  url "https://files.pythonhosted.org/packages/9f/7a/fb995bac7f1aebae92f5d061c0bc8c9ddf5b969f8e909c71b68e5c852e31/starshield_forensics-0.4.1.tar.gz"
  sha256 "922eb9a7d4b18ac6c6fe45bd1f81e23e34c0f9e828d712e97df33b2f9a87be48"
  license "MIT"

  depends_on "python@3.12"

  def install
    libexec.install "starshield", "LICENSE"
    (bin/"starshield").write <<~EOS
      #!/bin/bash
      set -euo pipefail
      export PYTHONPATH="#{libexec}"
      exec "#{Formula["python@3.12"].opt_bin}/python3.12" -P -s -m starshield.cli "$@"
    EOS
    chmod 0755, bin/"starshield"
  end

  test do
    output = shell_output("#{bin}/starshield demo")
    assert_match "starshield-forensics/0.4.1", output
    mcp_out = pipe_output("#{bin}/starshield mcp", '{"jsonrpc":"2.0","id":1,"method":"tools/list"}' + "\n")
    assert_match "starshield_demo", mcp_out
    assert_match "starshield_inspect_pdf_tamper", mcp_out

    (testpath/"starshield").mkpath
    (testpath/"starshield/__init__.py").write "raise RuntimeError('SHADOW_HIJACK')\n"
    (testpath/"starshield/cli.py").write "raise RuntimeError('SHADOW_HIJACK')\n"

    py = Formula["python@3.12"].opt_bin/"python3.12"
    userbase = testpath/"userbase"
    begin
      ENV["PYTHONUSERBASE"] = userbase.to_s
      usersite = Pathname.new(shell_output("#{py} -c 'import site; print(site.getusersitepackages())'").strip)
      ENV["PYTHONUSERSITE"] = usersite.to_s
      (usersite/"starshield").mkpath
      (usersite/"starshield/__init__.py").write "raise RuntimeError('USERSITE_HIJACK')\n"
      (usersite/"inject.pth").write "import os; os._exit(99)\n"

      safe_out = Dir.chdir(testpath) { shell_output("#{bin}/starshield demo") }
      assert_match "starshield-forensics/0.4.1", safe_out
    ensure
      ENV.delete("PYTHONUSERBASE")
      ENV.delete("PYTHONUSERSITE")
    end
  end
end
