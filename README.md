# Hound Integration Test

## Setup for Mac
## Step 1/2 Install selenium-server-standalone via Homebrew
```sh
$ brew install selenium-server-standalone
```

## ( if you installed firefox via Homebrew ) Step 2/2 Add Firefox Binary Path to PATH
```sh
$ echo 'export PATH=/opt/homebrew-cask/Caskroom/firefox/latest/Firefox.app/Contents/MacOS:$PATH' >> .zshrc
$ exec $SHELL -l
```

## Execute
## Step 1/2 Start Selenium Server in another window
```sh
$ selenium-server
```

## Step 2/2 Mix Test
```sh
$ cd phoenix_practice
$ mix test
```

# PhoenixPractice

To start your Phoenix app:

  1. Install dependencies with `mix deps.get`
  2. Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  3. Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: http://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
