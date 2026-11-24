class Crosstalk < Formula
  desc "Message other running agent sessions (Claude Code, Codex) by name"
  homepage "https://getcrosstalk.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/GoodOlClint/CrossTalk/releases/download/v0.3.0/crosstalk-v0.3.0-macos-universal.zip"
      sha256 "080f6310d5c668987a2e1e6030dc8836e6e55b15f5a1640684c768e4f275374b"
    end
    on_intel do
      url "https://github.com/GoodOlClint/CrossTalk/releases/download/v0.3.0/crosstalk-v0.3.0-macos-universal.zip"
      sha256 "080f6310d5c668987a2e1e6030dc8836e6e55b15f5a1640684c768e4f275374b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/GoodOlClint/CrossTalk/releases/download/v0.3.0/crosstalk-v0.3.0-linux-amd64.tar.gz"
      sha256 "4235b939feb1835d87e1312794a1c5d0e3e7f56ece96e4a99b17d9d57c10ca89"
    end
    on_arm do
      url "https://github.com/GoodOlClint/CrossTalk/releases/download/v0.3.0/crosstalk-v0.3.0-linux-arm64.tar.gz"
      sha256 "912fdb203f888f32e1610f5cec4086b3b27de867ccaec21c2c4ae8ef2214330d"
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
      and the plugin update runs on its own once the first session on the new version binds (unless `crosstalk install` already did it); a Codex thread binds at its first CrossTalk tool call.
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
