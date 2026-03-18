class Trolley < Formula
  desc "Terminal workspace manager powered by Ghostty"
  homepage "https://github.com/weedonandscott/trolley"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/weedonandscott/trolley/releases/download/v#{version}/trolley-cli-aarch64-macos.tar.xz"
      sha256 "b4aa1aa1223f255bd1bc20da2b23b091cd70a6653cdf94d93261be86a421b24a"
    else
      url "https://github.com/weedonandscott/trolley/releases/download/v#{version}/trolley-cli-x86_64-macos.tar.xz"
      sha256 "7f866c1e646b7ec6f2802b0cf07eef6615840dfefcb325cc81be77ddfc22203a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/weedonandscott/trolley/releases/download/v#{version}/trolley-cli-aarch64-linux.tar.xz"
      sha256 "3795208a81a38fe3a010e81eba3855fed263c194d52b6fd0cfd2721a2852c8ee"
    else
      url "https://github.com/weedonandscott/trolley/releases/download/v#{version}/trolley-cli-x86_64-linux.tar.xz"
      sha256 "6a3f002503f1faf87d5d3590d229424b7adc5841787ccc3370be51f4e5831817"
    end
  end

  def install
    bin.install "trolley"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trolley --version")
  end
end
