# typed: strict
# frozen_string_literal: true

cask "hiclaude" do
  version "0.1.0"
  sha256 "05e66eb53c226302b158bc4aacca5425b1750bf4e680fb5692d810b9c2f8121c"

  url "https://github.com/hayashirafael/hiclaude/releases/download/v#{version}/HiClaude-#{version}.dmg"
  name "HiClaude"
  desc "Menu bar app that opens the Claude plan's 5-hour usage window on a schedule"
  homepage "https://github.com/hayashirafael/hiclaude"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "HiClaude.app"

  zap trash: "~/Library/Preferences/dev.hiclaude.HiClaude.plist"

  caveats <<~EOS
    HiClaude is ad-hoc signed (not notarized — no paid Apple Developer account).
    On first launch, macOS Gatekeeper will block it. To open it:

      System Settings → Privacy & Security → "Open Anyway"

    or clear the quarantine flag yourself:

      xattr -dr com.apple.quarantine "#{appdir}/HiClaude.app"
  EOS
end
