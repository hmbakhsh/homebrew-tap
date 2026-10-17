cask "claude-account-switcher" do
  version "1.0"
  sha256 "3096747e8dcedb1d617b5017499a524e39388bb3a397503f52c64600dcab32e8"

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

  uninstall quit:      "dev.claude-swap.switcher",
            launchctl: ["dev.claude-swap.auto", "com.cswap.menubar"]

  zap trash: "~/Library/Logs/claude-account-switcher.log"

  caveats <<~EOS
    Claude Account Switcher is ad-hoc signed. This cask removes its quarantine
    attribute during installation until a notarized release is available.
  EOS
end
