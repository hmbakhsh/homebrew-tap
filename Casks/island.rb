cask "island" do
  version "0.2.3"
  sha256 "9f56a471f4349aeb121bd61ad35aadac31eaaa5312392bf6c8091d7dec77fb18"

  url "https://github.com/hmbakhsh/island/releases/download/v#{version}/Island.zip"
  name "Island"
  desc "Messages from scripts and agents in a pop-out island at the notch"
  homepage "https://github.com/hmbakhsh/island"

  auto_updates true
  depends_on macos: :sonoma

  app "Island.app"
  binary "#{appdir}/Island.app/Contents/MacOS/Island",
         target: "island"
  # The CLI's name before the rename; scripts and agents still call it.
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
