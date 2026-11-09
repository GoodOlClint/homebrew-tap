class Crosstalk < Formula
  desc "Message other running agent sessions (Claude Code, Codex) by name"
  homepage "https://getcrosstalk.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/GoodOlClint/CrossTalk/releases/download/v0.2.0/crosstalk-v0.2.0-macos-universal.zip"
      sha256 "aa4a857c8341fa8a106f380be35a3feba5654e17cab2e62417591057b3373e99"
    end
    on_intel do
      url "https://github.com/GoodOlClint/CrossTalk/releases/download/v0.2.0/crosstalk-v0.2.0-macos-universal.zip"
      sha256 "aa4a857c8341fa8a106f380be35a3feba5654e17cab2e62417591057b3373e99"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/GoodOlClint/CrossTalk/releases/download/v0.2.0/crosstalk-v0.2.0-linux-amd64.tar.gz"
      sha256 "1625b98ad3f53fcdb5c2912fb2f61f8a9928fbd57570f79ceb20ebe2ee26e907"
    end
    on_arm do
      url "https://github.com/GoodOlClint/CrossTalk/releases/download/v0.2.0/crosstalk-v0.2.0-linux-arm64.tar.gz"
      sha256 "1951c343a1ae65d571645d4d85ecfd0850094ad9e847447b49add722d1546cc7"
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
