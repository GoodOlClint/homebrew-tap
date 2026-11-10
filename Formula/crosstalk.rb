class Crosstalk < Formula
  desc "Message other running agent sessions (Claude Code, Codex) by name"
  homepage "https://getcrosstalk.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/GoodOlClint/CrossTalk/releases/download/v0.2.1/crosstalk-v0.2.1-macos-universal.zip"
      sha256 "116bd778005bd76c3cce472312db58ddfb41d4e81eb55aeeb3615ae9d388b8d6"
    end
    on_intel do
      url "https://github.com/GoodOlClint/CrossTalk/releases/download/v0.2.1/crosstalk-v0.2.1-macos-universal.zip"
      sha256 "116bd778005bd76c3cce472312db58ddfb41d4e81eb55aeeb3615ae9d388b8d6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/GoodOlClint/CrossTalk/releases/download/v0.2.1/crosstalk-v0.2.1-linux-amd64.tar.gz"
      sha256 "8d601feaedaba65f2491c7c82e15d9410a4c4b1a9c0123875c9c8ab2240d4116"
    end
    on_arm do
      url "https://github.com/GoodOlClint/CrossTalk/releases/download/v0.2.1/crosstalk-v0.2.1-linux-arm64.tar.gz"
      sha256 "6d439da1e691988c20b7c2606e0953685fba46a7a4c8ea0020814fe54ea3c51f"
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
