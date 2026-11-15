# hmbakhsh Homebrew Tap

Homebrew packages maintained by [hmbakhsh](https://github.com/hmbakhsh).

## Rootie

Install the macOS app and CLI:

```sh
brew install --cask hmbakhsh/tap/rootie
```

Then configure it:

```sh
rootie setup
rootie config
rootie validate
rootie default
```

See [rootie.hbak.co](https://rootie.hbak.co) or the
[source repository](https://github.com/hmbakhsh/rootie).

## ClaudeSwap

Mac app that keeps Claude Code on whichever of your Claude subscriptions has the
most usage left, switching before one runs out:

```sh
brew install --cask hmbakhsh/tap/claudeswap
```

See the [source repository](https://github.com/hmbakhsh/claudeswap).

## Island

Messages from scripts and agents in a black island that grows out of the
MacBook notch, plus the `island` CLI to send them (`notch`, its old name, also works):

```sh
brew trust --cask hmbakhsh/tap/island
brew install --cask hmbakhsh/tap/island
open -a Island
```

See the [source repository](https://github.com/hmbakhsh/island).
