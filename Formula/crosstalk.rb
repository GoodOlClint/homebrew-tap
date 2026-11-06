class Crosstalk < Formula
  desc "Message other running agent sessions (Claude Code, Codex) by name"
  homepage "https://getcrosstalk.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/GoodOlClint/CrossTalk/releases/download/v0.1.5/crosstalk-v0.1.5-macos-universal.zip"
      sha256 "8fcd9515bfc0e871e3adc6964bd21d635c2cdd24a0028cc4b6708584da81bff2"
    end
    on_intel do
      url "https://github.com/GoodOlClint/CrossTalk/releases/download/v0.1.5/crosstalk-v0.1.5-macos-universal.zip"
      sha256 "8fcd9515bfc0e871e3adc6964bd21d635c2cdd24a0028cc4b6708584da81bff2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/GoodOlClint/CrossTalk/releases/download/v0.1.5/crosstalk-v0.1.5-linux-amd64.tar.gz"
      sha256 "3ba406476a90b71d2038c75fa5b12830237e4a850338a6334feb500cf9f2d3da"
    end
    on_arm do
      url "https://github.com/GoodOlClint/CrossTalk/releases/download/v0.1.5/crosstalk-v0.1.5-linux-arm64.tar.gz"
      sha256 "9f3ea46a127a966fbc8681f75ea78c9e8d6aac1558eec61c745a71d8a86301d8"
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
