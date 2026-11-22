class Crosstalk < Formula
  desc "Message other running agent sessions (Claude Code, Codex) by name"
  homepage "https://getcrosstalk.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/GoodOlClint/CrossTalk/releases/download/v0.2.5/crosstalk-v0.2.5-macos-universal.zip"
      sha256 "1fbf3a20e1ea7fb78fd8764571ccb1dacd91c33faffea6e81368671b580062ec"
    end
    on_intel do
      url "https://github.com/GoodOlClint/CrossTalk/releases/download/v0.2.5/crosstalk-v0.2.5-macos-universal.zip"
      sha256 "1fbf3a20e1ea7fb78fd8764571ccb1dacd91c33faffea6e81368671b580062ec"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/GoodOlClint/CrossTalk/releases/download/v0.2.5/crosstalk-v0.2.5-linux-amd64.tar.gz"
      sha256 "87bbb4e7a7466e62b9d89ef2d8c46200a45156fe2d726c443464ff6118f1abb7"
    end
    on_arm do
      url "https://github.com/GoodOlClint/CrossTalk/releases/download/v0.2.5/crosstalk-v0.2.5-linux-arm64.tar.gz"
      sha256 "6d159e046839dc16805b773fb248427841ad78e1431c8ef2ed47581974db5329"
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
