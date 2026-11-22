# frozen_string_literal: true

# macpilot: drive and verify macOS apps through accessibility, in the background.
class Macpilot < Formula
  desc "Drive and verify macOS apps through accessibility, in the background"
  homepage "https://github.com/tfoutrein/macpilot-releases"
  url "https://github.com/tfoutrein/macpilot-releases/releases/download/v1.1.0/macpilot-1.1.0-universal.tar.gz"
  sha256 "2a065ba0a7002d29b5c74638bb09a74d83ebc8bac59a7fffd8fc475e32deb219"
  license :cannot_represent # macpilot binary license, see the releases repository

  depends_on macos: :sonoma

  def install
    bin.install "macpilot"
  end

  def caveats
    <<~EOS
      macpilot needs Accessibility and Screen Recording. Run:
        macpilot doctor                     # which app macOS checks, and what is missing
        macpilot setup-permissions --guide  # opens the right System Settings panes
    EOS
  end

  test do
    assert_match "\"version\":\"#{version}\"", shell_output("#{bin}/macpilot --version")
    assert_match "name: macpilot", shell_output("#{bin}/macpilot skills get")
  end
end
