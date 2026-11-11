cask "notch-island" do
  version "0.1.3"
  sha256 "86526da06adbc74ac653c512e11834e21232c6e6a5f9efffde4eca9c2eeba8f2"

  url "https://github.com/hmbakhsh/notch-island/releases/download/v#{version}/Island.zip"
  name "Island"
  desc "Messages from scripts and agents in a pop-out island at the notch"
  homepage "https://github.com/hmbakhsh/notch-island"

  auto_updates true
  depends_on macos: :sonoma

  app "Island.app"
  binary "#{appdir}/Island.app/Contents/MacOS/Island",
         target: "notch"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Island.app"]
  end

  uninstall launchctl: "dev.notchisland.island",
            quit:      "dev.notchisland.Island",
            delete:    "~/Library/LaunchAgents/dev.notchisland.island.plist"

  zap trash: [
    "~/.config/notch-island",
    "~/.local/state/notch",
  ]

  caveats <<~EOS
    Island is ad-hoc signed. This cask removes its quarantine attribute during
    installation until a notarized release is available.

    Start it once; it adds itself as a login item:

      open -a Island
  EOS
end
