class Starcouncil < Formula
  desc "Compatibility alias for DiffQuorum (pointer blackboard, blind quorum & 6-gate wakeup CLI)"
  homepage "https://github.com/Ziqi/diffquorum"
  url "https://github.com/Ziqi/diffquorum/releases/download/v0.2.0/diffquorum-v0.2.0.tar.gz"
  sha256 "9c20bf25a75a25c6959a50663f782473ec34de82c73bc9ed24c7813d8d08fd2f"
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
    assert_match "0.2.0", ver_out
    system bin/"starcouncil", "init", "--root", testpath/"sc-demo"
    system bin/"starcouncil", "doctor", "--root", testpath/"sc-demo"
    system bin/"starcouncil", "council", "--root", testpath/"sc-demo", "--topic", "Brew compat test"
  end
end
