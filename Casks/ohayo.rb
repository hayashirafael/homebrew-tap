# typed: strict
# frozen_string_literal: true

cask "ohayo" do
  version "1.3.0"
  sha256 "0cc6bead242474efdab8609fc6bf892f1c1e9e0e65296e390153c0259100ddee"

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
