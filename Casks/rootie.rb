cask "rootie" do
  version "0.3.2"
  sha256 "c2c32930da4cf0d469fcdbbafa25f80ab5a2dee58bc8852f4fc3548b5928f76d"

  url "https://github.com/hmbakhsh/rootie/releases/download/v#{version}/Rootie.zip"
  name "Rootie"
  desc "Route external links to Chromium browser profiles"
  homepage "https://rootie.hbak.co/"

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
