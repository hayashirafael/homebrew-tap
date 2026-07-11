# typed: strict
# frozen_string_literal: true

cask "hiclaude" do
  version "0.4.2"
  sha256 "bcca066e2fcf9d87a795f1b5c72e0140383c3797c617545ba288b60aca3d1860"

  url "https://github.com/hayashirafael/hiclaude/releases/download/v#{version}/HiYashi-#{version}.dmg"
  name "HiYashi"
  desc "Menu bar scheduler for Claude and Codex usage windows and commands"
  homepage "https://github.com/hayashirafael/hiclaude"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "HiYashi.app"

  zap trash: "~/Library/Preferences/dev.hiclaude.HiClaude.plist"

  caveats <<~EOS
    HiYashi is ad-hoc signed (not notarized — no paid Apple Developer account).
    On first launch, macOS Gatekeeper will block it. To open it:

      System Settings → Privacy & Security → "Open Anyway"

    or clear the quarantine flag yourself:

      xattr -dr com.apple.quarantine "#{appdir}/HiYashi.app"
  EOS
end
