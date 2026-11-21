class Macpilot < Formula
  desc "Drive and verify macOS apps through accessibility, in the background"
  homepage "https://github.com/tfoutrein/macpilot-releases"
  url "https://github.com/tfoutrein/macpilot-releases/releases/download/v0.9.0/macpilot-0.9.0-universal.tar.gz"
  sha256 "8a2e050361e9ff400362ff66e065e4ee9661c779ea8839e22f19dab95ac3646e"
  version "0.9.0"
  license :cannot_represent # macpilot binary license, see the releases repository

  depends_on macos: :sonoma

  def install
    bin.install "macpilot"
  end

  def caveats
    <<~EOS
      macpilot needs Accessibility and Screen Recording. Run:
        macpilot setup-permissions
        macpilot doctor
    EOS
  end

  test do
    assert_match "\"version\":\"#{version}\"", shell_output("#{bin}/macpilot --version")
  end
end
