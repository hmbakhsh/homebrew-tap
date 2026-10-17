cask "claude-account-switcher" do
  version "1.3"
  sha256 "f2d6af6c69881dade74002b3eec781432ff0299d9ebab99f1a4f32d3a32da9aa"

  url "https://github.com/hmbakhsh/claude-account-switcher/releases/download/v#{version}/Claude-Account-Switcher.zip"
  name "Claude Account Switcher"
  desc "Keep Claude Code on the subscription with the most usage left"
  homepage "https://github.com/hmbakhsh/claude-account-switcher"

  depends_on macos: :ventura

  app "Claude Account Switcher.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Claude Account Switcher.app"]
  end

  uninstall quit: "dev.claude-swap.switcher"

  # Background services keep running across upgrades; only a full zap stops them.
  zap launchctl: ["dev.claude-swap.auto", "com.cswap.menubar"],
      trash:     "~/Library/Logs/claude-account-switcher.log"

  caveats <<~EOS
    Claude Account Switcher is ad-hoc signed. This cask removes its quarantine
    attribute during installation until a notarized release is available.
  EOS
end
