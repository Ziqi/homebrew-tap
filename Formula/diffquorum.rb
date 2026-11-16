class Diffquorum < Formula
  desc "Zero-dependency multi-agent pointer coordination, blind anti-fake-quorum & modal-safe wake CLI"
  homepage "https://github.com/Ziqi/diffquorum"
  url "https://github.com/Ziqi/diffquorum/releases/download/v0.2.0/diffquorum-v0.2.0.tar.gz"
  sha256 "9c20bf25a75a25c6959a50663f782473ec34de82c73bc9ed24c7813d8d08fd2f"
  license "MIT"

  depends_on "python@3.12"

  def install
    libexec.mkpath
    system "cp", "-R", ".", libexec
    (bin/"diffquorum").write <<~EOS
      #!/bin/bash
      set -euo pipefail
      exec "#{Formula["python@3.12"].opt_bin}/python3.12" "#{libexec}/scripts/diffquorum.py" "$@"
    EOS
    chmod 0755, bin/"diffquorum"
    bin.install_symlink "diffquorum" => "dq"
  end

  test do
    ver_out = shell_output("#{bin}/diffquorum --version")
    assert_match "0.2.0", ver_out
    system bin/"diffquorum", "init", "--root", testpath/"dq-demo"
    system bin/"diffquorum", "preflight", "--root", testpath/"dq-demo", "--write-path", testpath/"dq-demo"
    system bin/"diffquorum", "doctor", "--root", testpath/"dq-demo"
    system bin/"diffquorum", "quorum", "--root", testpath/"dq-demo", "--topic", "Brew smoke test"
  end
end
