class Trolley < Formula
  desc "Terminal workspace manager powered by Ghostty"
  homepage "https://github.com/weedonandscott/trolley"
  version "0.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/weedonandscott/trolley/releases/download/v#{version}/trolley-cli-aarch64-macos.tar.xz"
      sha256 "576b46bb16f2e1fdb9b28d5c11f61768cd4d1f469a7b8bc34677ea323db2170a"
    else
      url "https://github.com/weedonandscott/trolley/releases/download/v#{version}/trolley-cli-x86_64-macos.tar.xz"
      sha256 "ed31519e73bbd9211a76c9f1861f88be666c8fa9bf86426bad52abf82fa4b4ee"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/weedonandscott/trolley/releases/download/v#{version}/trolley-cli-aarch64-linux.tar.xz"
      sha256 "86d94e5023475857a1981ecd61005505e0553e7fdae3e0039dbefa058ac7d7f1"
    else
      url "https://github.com/weedonandscott/trolley/releases/download/v#{version}/trolley-cli-x86_64-linux.tar.xz"
      sha256 "d548ff705aa459fa79806ed11266e05420bd6cfaa1ee4b815b3093c66da59bc4"
    end
  end

  def install
    bin.install "trolley"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trolley --version")
  end
end
