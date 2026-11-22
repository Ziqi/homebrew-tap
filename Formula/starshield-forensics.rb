class StarshieldForensics < Formula
  desc "Offline Chromium LevelDB carver, container inspector, and read-only MCP CLI"
  homepage "https://ziqi.github.io/starshield/"
  url "https://files.pythonhosted.org/packages/cb/89/09c327c8f43bd1f3ad62eac22ad8792c88f8be9402151e293383a427817d/starshield_forensics-0.3.11.tar.gz"
  sha256 "fbb0c7cb9f9430e4685fdc3b29e78ec5039720f55f058badc208d96cabdd7221"
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
    assert_match "starshield-forensics/0.3.11", output
    mcp_out = pipe_output("#{bin}/starshield mcp", '{"jsonrpc":"2.0","id":1,"method":"tools/list"}' + "\n")
    assert_match "starshield_demo", mcp_out

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
      assert_match "starshield-forensics/0.3.11", safe_out
    ensure
      ENV.delete("PYTHONUSERBASE")
      ENV.delete("PYTHONUSERSITE")
    end
  end
end
