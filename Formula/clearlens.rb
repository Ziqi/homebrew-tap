class Clearlens < Formula
  desc "Zero-backend BEC, wire fraud, and digital coercion triage workbench"
  homepage "https://ziqi.github.io/clearlens/"
  url "https://github.com/Ziqi/clearlens/releases/download/v1.0.0/clearlens-offline-v1.0.0.zip"
  sha256 "6ab659e01d7ed4b9e04911dc3bae19a7207322515751646e7fa41a33ff7fe0c7"
  license "MIT"

  depends_on "python@3.12"

  resource "clearlens_pyz" do
    url "https://github.com/Ziqi/clearlens/releases/download/v1.0.0/clearlens.pyz", using: :nounzip
    sha256 "e3a9130292f983f5a6b65477b49f45c6ce7d965d9135c74bb80f4deacdb8ff20"
  end

  def install
    libexec.mkpath
    pkgshare.install "web"
    resource("clearlens_pyz").stage do
      libexec.install "clearlens.pyz"
    end
    (bin/"clearlens").write <<~EOS
      #!/bin/bash
      set -euo pipefail
      exec "#{Formula["python@3.12"].opt_bin}/python3.12" "#{libexec}/clearlens.pyz" "$@"
    EOS
    chmod 0755, bin/"clearlens"
  end

  test do
    demo_out = shell_output("#{bin}/clearlens demo")
    assert_match "SYN-BEC-2026-041", demo_out
    system bin/"clearlens", "verify", pkgshare/"web"
    system bin/"clearlens", "dlp-scan", "--text", "Invoice INV-2026-8841 is queued in routine settlement review.", "--strict"
  end
end
