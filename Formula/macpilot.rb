# frozen_string_literal: true

# macpilot: drive and verify macOS apps through accessibility, in the background.
class Macpilot < Formula
  desc "Drive and verify macOS apps through accessibility, in the background"
  homepage "https://github.com/tfoutrein/macpilot-releases"
  url "https://github.com/tfoutrein/macpilot-releases/releases/download/v1.0.0/macpilot-1.0.0-universal.tar.gz"
  sha256 "6719754a213c4649dbd54b3d4d144f94523800d4af3083f4417a7b0f2ddb5042"
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
