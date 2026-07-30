# typed: strict
# frozen_string_literal: true

cask "ohayo" do
  version "1.3.1"
  sha256 "c481a9d25a6cb0c1a492629d9ec06af9a13b6c36f73da5045f1fd34c14aed190"

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
