class Crosstalk < Formula
  desc "Message other running agent sessions (Claude Code, Codex) by name"
  homepage "https://getcrosstalk.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/GoodOlClint/CrossTalk/releases/download/v0.2.6/crosstalk-v0.2.6-macos-universal.zip"
      sha256 "8172476919e1bcdcab73902e4e7154112e2321795563e736b83d197f1948e061"
    end
    on_intel do
      url "https://github.com/GoodOlClint/CrossTalk/releases/download/v0.2.6/crosstalk-v0.2.6-macos-universal.zip"
      sha256 "8172476919e1bcdcab73902e4e7154112e2321795563e736b83d197f1948e061"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/GoodOlClint/CrossTalk/releases/download/v0.2.6/crosstalk-v0.2.6-linux-amd64.tar.gz"
      sha256 "fc6d67cc930c3b4a26839e46f6650f51455bbcd1676557c1d7a2bc0a1fc703a3"
    end
    on_arm do
      url "https://github.com/GoodOlClint/CrossTalk/releases/download/v0.2.6/crosstalk-v0.2.6-linux-arm64.tar.gz"
      sha256 "821a4d2494b9f04a68f3f1f8d28ab270fdb36b7cb30906a5687eb1323601108b"
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
