class Crosstalk < Formula
  desc "Message other running agent sessions (Claude Code, Codex) by name"
  homepage "https://getcrosstalk.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/GoodOlClint/CrossTalk/releases/download/v0.2.3/crosstalk-v0.2.3-macos-universal.zip"
      sha256 "256a49392aaac91831b3166d6b96ea71a26baa2f8922528d4937380736b26995"
    end
    on_intel do
      url "https://github.com/GoodOlClint/CrossTalk/releases/download/v0.2.3/crosstalk-v0.2.3-macos-universal.zip"
      sha256 "256a49392aaac91831b3166d6b96ea71a26baa2f8922528d4937380736b26995"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/GoodOlClint/CrossTalk/releases/download/v0.2.3/crosstalk-v0.2.3-linux-amd64.tar.gz"
      sha256 "1d1eb74f2163ba0d9034eba1285e8945b52d7d49e1b8fa0ad24b19a7fde6150d"
    end
    on_arm do
      url "https://github.com/GoodOlClint/CrossTalk/releases/download/v0.2.3/crosstalk-v0.2.3-linux-arm64.tar.gz"
      sha256 "b39674fcb16a4fb30b98b4fc9f22e4310ee06f64704e2bd8d53a83eec81ca4b1"
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
