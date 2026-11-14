class StarshieldForensics < Formula
  desc "Clean-room deterministic Chromium LevelDB .log carver and DFIR triage CLI"
  homepage "https://ziqi.github.io/starshield/"
  url "https://github.com/Ziqi/starshield-forensics/releases/download/v0.3.7/starshield_forensics-0.3.7.tar.gz"
  sha256 "2dd56e823d46fd41d570ee6281d98db120ad64e64b55950827ef57c186e40edd"
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
    assert_match "starshield-forensics/0.3.7", output
  end
end
