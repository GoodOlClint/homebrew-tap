class Crosstalk < Formula
  desc "Message other running agent sessions (Claude Code, Codex) by name"
  homepage "https://getcrosstalk.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/GoodOlClint/CrossTalk/releases/download/v0.1.4/crosstalk-v0.1.4-macos-universal.zip"
      sha256 "fa6e1959e69416eac1a9cc0c0eeb42fca49bced00dd7b8c4eb3851bf29a3c56a"
    end
    on_intel do
      url "https://github.com/GoodOlClint/CrossTalk/releases/download/v0.1.4/crosstalk-v0.1.4-macos-universal.zip"
      sha256 "fa6e1959e69416eac1a9cc0c0eeb42fca49bced00dd7b8c4eb3851bf29a3c56a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/GoodOlClint/CrossTalk/releases/download/v0.1.4/crosstalk-v0.1.4-linux-amd64.tar.gz"
      sha256 "10df30c5fc18b8a221adfdcce41da491a22ff795c66478b0c202e511523c9b19"
    end
    on_arm do
      url "https://github.com/GoodOlClint/CrossTalk/releases/download/v0.1.4/crosstalk-v0.1.4-linux-arm64.tar.gz"
      sha256 "df535a18b5d7191e79de1e2f7832d8c85d075bf78964bb8b29fba0293e2de63e"
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
