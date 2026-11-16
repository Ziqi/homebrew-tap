class Starcouncil < Formula
  desc "Pointer-Over-Blackboard orchestration, anti-fake-council verifier & 6-gate wakeup CLI"
  homepage "https://github.com/Ziqi/starcouncil"
  url "https://github.com/Ziqi/starcouncil/releases/download/v0.1.1/starcouncil-v0.1.1.tar.gz"
  sha256 "9d3bfbdec5694729d6abe3221bd96d1bc1a61d47eca9b274cd66f5a15d4a1af2"
  license "MIT"

  depends_on "python@3.12"

  def install
    libexec.mkpath
    system "cp", "-R", ".", libexec
    (bin/"starcouncil").write <<~EOS
      #!/bin/bash
      set -euo pipefail
      exec "#{Formula["python@3.12"].opt_bin}/python3.12" "#{libexec}/scripts/starcouncil.py" "$@"
    EOS
    chmod 0755, bin/"starcouncil"
  end

  test do
    ver_out = shell_output("#{bin}/starcouncil --version")
    assert_match "0.1.1", ver_out
    system bin/"starcouncil", "init", "--root", testpath/"sc-demo"
    system bin/"starcouncil", "doctor", "--root", testpath/"sc-demo"
    system bin/"starcouncil", "council", "--root", testpath/"sc-demo", "--topic", "Brew smoke test"
  end
end
