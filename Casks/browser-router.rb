cask "browser-router" do
  version "0.2.0"
  sha256 "004eac04a3173c08119d0411c8378a8f5fdbe65a404e02a9921bce0af1a3048d"

  url "https://github.com/hmbakhsh/browser-router/releases/download/v#{version}/Browser-Router.zip"
  name "Browser Router"
  desc "Route external links to Chromium browser profiles"
  homepage "https://rootie.hbak.co"

  depends_on macos: :ventura

  app "Browser Router.app"
  binary "#{appdir}/Browser Router.app/Contents/MacOS/BrowserRouter",
         target: "browser-router"

  uninstall quit: "io.github.hmbakhsh.browser-router"

  caveats <<~EOS
    Browser Router is not yet notarized. If macOS blocks the first launch,
    open System Settings → Privacy & Security and choose “Open Anyway”.

    Then configure it with:

      browser-router setup
      browser-router config
      browser-router validate
      browser-router default
  EOS
end
