class StarhubKit < Formula
  desc "Declarative compiler for Tailscale 4via6, split-DNS, and AI sandbox firewalls"
  homepage "https://github.com/Ziqi/starhub-kit"
  url "https://github.com/Ziqi/starhub-kit/releases/download/v1.2.0/starhub-kit-v1.2.0.tar.gz"
  sha256 "2e14ca825474ebea21b677705ccdcd151539700406bab6e3e0154ae9bcefd7ba"
  license "MIT"

  depends_on "python@3.12"

  def install
    libexec.mkpath
    system "cp", "-R", ".", libexec
    (bin/"starhub").write <<~EOS
      #!/bin/bash
      set -euo pipefail
      exec "#{Formula["python@3.12"].opt_bin}/python3.12" "#{libexec}/scripts/starhub-ctl.py" --repo-root "#{libexec}" "$@"
    EOS
    chmod 0755, bin/"starhub"
  end

  test do
    output = shell_output("#{bin}/starhub render --profile minimal --only mihomo --dry-run")
    assert_match "DRY-RUN PREVIEW", output
    system bin/"starhub", "render", "--check"
    system bin/"starhub", "doctor", "--local-docs-only"
  end
end
