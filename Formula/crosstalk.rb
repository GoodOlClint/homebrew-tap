class Crosstalk < Formula
  desc "Message other running agent sessions (Claude Code, Codex) by name"
  homepage "https://getcrosstalk.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/GoodOlClint/CrossTalk/releases/download/v0.2.4/crosstalk-v0.2.4-macos-universal.zip"
      sha256 "90abaeee236bda19b6dacf26478ed5d5cc4fd8d6e2a9c649fce72110296956e8"
    end
    on_intel do
      url "https://github.com/GoodOlClint/CrossTalk/releases/download/v0.2.4/crosstalk-v0.2.4-macos-universal.zip"
      sha256 "90abaeee236bda19b6dacf26478ed5d5cc4fd8d6e2a9c649fce72110296956e8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/GoodOlClint/CrossTalk/releases/download/v0.2.4/crosstalk-v0.2.4-linux-amd64.tar.gz"
      sha256 "a156761ff596d2a0ed0526144ccb02554609e1fc50fc6fef5628d83660e1f17a"
    end
    on_arm do
      url "https://github.com/GoodOlClint/CrossTalk/releases/download/v0.2.4/crosstalk-v0.2.4-linux-arm64.tar.gz"
      sha256 "7a6593ac3de479aa3cf95baeb67c1e348084508eddcb3ed4e3946c260eac0fad"
    end
  end

  def install
    bin.install "crosstalk"
  end

  def caveats
    <<~EOS
      Register CrossTalk with Claude Code and Codex:
        crosstalk install
      After `brew upgrade crosstalk`, running sessions refresh on their own once they are idle,
      and the plugin update runs on its own when the first session on the new version starts (unless `crosstalk install` already did it).
      `crosstalk install` stays the manual path, and the only way to change registration, allow rules, PATH or Codex config.
      A session started before this feature, or with CROSSTALK_NO_AUTO_REFRESH=1, needs a restart by hand;
      with CROSSTALK_NO_AUTO_REFRESH=1 also run `crosstalk install`, which updates the plugin and gateway.
      `crosstalk install --check` (K11) lists shims that have not refreshed.
      Before `brew uninstall crosstalk`, run:
        crosstalk uninstall
      Restart running Claude and Codex sessions after uninstall.
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/crosstalk version").strip
  end
end
