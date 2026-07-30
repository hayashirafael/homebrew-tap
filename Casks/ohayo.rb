# typed: strict
# frozen_string_literal: true

cask "ohayo" do
  version "1.2.0"
  sha256 "c3d0c278270438c1db1471be8800fddea9faffbc71bfa8073326925bd79ace5b"

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
