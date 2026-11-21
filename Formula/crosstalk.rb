class Crosstalk < Formula
  desc "Message other running agent sessions (Claude Code, Codex) by name"
  homepage "https://getcrosstalk.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/GoodOlClint/CrossTalk/releases/download/v0.2.2/crosstalk-v0.2.2-macos-universal.zip"
      sha256 "be93a0854a0c197038756eea35ca12f0f3f8c4af4bd28586a13ee3afdf40cab6"
    end
    on_intel do
      url "https://github.com/GoodOlClint/CrossTalk/releases/download/v0.2.2/crosstalk-v0.2.2-macos-universal.zip"
      sha256 "be93a0854a0c197038756eea35ca12f0f3f8c4af4bd28586a13ee3afdf40cab6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/GoodOlClint/CrossTalk/releases/download/v0.2.2/crosstalk-v0.2.2-linux-amd64.tar.gz"
      sha256 "0c0b98d106067b46e73ebc84f3bc349a21ea57d6bd89699f99efc1e856efb2a5"
    end
    on_arm do
      url "https://github.com/GoodOlClint/CrossTalk/releases/download/v0.2.2/crosstalk-v0.2.2-linux-arm64.tar.gz"
      sha256 "eacfae638e4be27b5f56c2cc3b4349d83479f043ba42cf0d5899d5315cbb5f02"
    end
  end

  def install
    bin.install "crosstalk"
  end

  def caveats
    <<~EOS
      Register CrossTalk with Claude Code and Codex:
        crosstalk install
      Run it again after `brew upgrade crosstalk` so the plugin matches the binary.
      Before `brew uninstall crosstalk`, run:
        crosstalk uninstall
      Restart running Claude and Codex sessions after either.
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/crosstalk version").strip
  end
end
