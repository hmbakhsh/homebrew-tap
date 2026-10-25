cask "rootie" do
  version "0.5.1"
  sha256 "29570ae32d28285788a64936f4e6aabbe8ec55e93b6da79dc041d68fc00d49d0"

  url "https://github.com/hmbakhsh/rootie/releases/download/v#{version}/Rootie.zip"
  name "Rootie"
  desc "Route external links to Chromium browser profiles"
  homepage "https://rootie.hbak.co/"

  auto_updates true
  depends_on macos: :ventura

  app "Rootie.app"
  binary "#{appdir}/Rootie.app/Contents/MacOS/Rootie",
         target: "rootie"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Rootie.app"]
  end

  uninstall quit: "io.github.hmbakhsh.rootie"

  caveats <<~EOS
    Rootie is currently ad-hoc signed. This custom cask removes its quarantine
    attribute during installation until a notarized release is available.

    Then configure it with:

      rootie setup
      rootie config
      rootie validate
      rootie default
  EOS
end
