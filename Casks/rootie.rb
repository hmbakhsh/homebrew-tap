cask "rootie" do
  version "0.3.0"
  sha256 "7c4b1a4f9f69d76fb6d554994e57f353a1e815a35e1cdce86ff10cff3bbb0a7b"

  url "https://github.com/hmbakhsh/rootie/releases/download/v#{version}/Rootie.zip"
  name "Rootie"
  desc "Route external links to Chromium browser profiles"
  homepage "https://rootie.hbak.co"

  depends_on macos: :ventura

  app "Rootie.app"
  binary "#{appdir}/Rootie.app/Contents/MacOS/Rootie",
         target: "rootie"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Rootie.app"]
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
