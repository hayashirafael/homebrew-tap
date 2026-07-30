# typed: strict
# frozen_string_literal: true

cask "ohayo" do
  version "1.2.1"
  sha256 "5d68a601b05ef37d7c1785c04cde745d0e5396ed1990dfd0ac1ae66f3af3cf07"

  url "https://github.com/hayashirafael/ohayo/releases/download/v#{version}/Ohayo-#{version}.dmg"
  name "Ohayo"
  desc "Menu bar scheduler for Claude and Codex usage windows and commands"
  homepage "https://github.com/hayashirafael/ohayo"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  depends_on macos: :ventura

  app "Ohayo.app"

  zap trash: "~/Library/Preferences/io.github.hayashirafael.Ohayo.plist"

  caveats <<~EOS
    Interactive Claude/Codex tasks open Terminal. On first use, macOS may ask
    you to allow Ohayo to automate Terminal in:

      System Settings → Privacy & Security → Automation
  EOS
end
