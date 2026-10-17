cask "claudeswap" do
  version "1.7"
  sha256 "2aa5c92a0ff94e22f2b1c8d9d509a74b2c95fdb99a1524bc3a0de7bc21c0e06a"

  url "https://github.com/hmbakhsh/claudeswap/releases/download/v#{version}/ClaudeSwap.zip"
  name "ClaudeSwap"
  desc "Keep Claude Code on the subscription with the most usage left"
  homepage "https://github.com/hmbakhsh/claudeswap"

  depends_on macos: :ventura

  app "ClaudeSwap.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/ClaudeSwap.app"]
  end

  uninstall quit: "dev.claude-swap.switcher"

  # Background services keep running across upgrades; only a full zap stops them.
  zap launchctl: ["dev.claude-swap.auto", "com.cswap.menubar"],
      trash:     [
        "~/Library/Logs/claude-account-switcher.log",
        "~/Library/Logs/claudeswap.log",
      ]

  caveats <<~EOS
    ClaudeSwap is ad-hoc signed. This cask removes its quarantine
    attribute during installation until a notarized release is available.
  EOS
end
