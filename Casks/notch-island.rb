cask "notch-island" do
  version "0.2.1"
  sha256 "feba1d2ca4a5612c2135b6e11d729c7e4728a360a9e88fd208a515762ebd6827"

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
