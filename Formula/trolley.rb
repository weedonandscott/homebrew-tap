class Trolley < Formula
  desc "Terminal workspace manager powered by Ghostty"
  homepage "https://github.com/weedonandscott/trolley"
  version "0.6.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/weedonandscott/trolley/releases/download/v#{version}/trolley-cli-aarch64-macos.tar.xz"
      sha256 "381863dc314567a414645e2b0c14b90c38abdcc283a844a919d86f805b7207a9"
    else
      url "https://github.com/weedonandscott/trolley/releases/download/v#{version}/trolley-cli-x86_64-macos.tar.xz"
      sha256 "c6a437a3112f03f9945cca4eadfe6c3db578efa3cd94abd509fbda5a2897bff6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/weedonandscott/trolley/releases/download/v#{version}/trolley-cli-aarch64-linux.tar.xz"
      sha256 "09409cb1c9099c3b705e568cf62f853d60285966f13517584c98d8060c4f9800"
    else
      url "https://github.com/weedonandscott/trolley/releases/download/v#{version}/trolley-cli-x86_64-linux.tar.xz"
      sha256 "3880e933771718a5d0f0f07205623e3567950c3e8d4421a9d9cbb49947598ff0"
    end
  end

  def install
    bin.install "trolley"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trolley --version")
  end
end
