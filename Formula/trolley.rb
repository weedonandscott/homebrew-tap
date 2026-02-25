class Trolley < Formula
  desc "Terminal workspace manager powered by Ghostty"
  homepage "https://github.com/weedonandscott/trolley"
  version "0.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/weedonandscott/trolley/releases/download/v#{version}/trolley-cli-aarch64-macos.tar.xz"
      sha256 "e1c2cb9305fddf6cf760efac30e3bbac10335085bb422b8218568dc5405cfd17"
    else
      url "https://github.com/weedonandscott/trolley/releases/download/v#{version}/trolley-cli-x86_64-macos.tar.xz"
      sha256 "ca953f6fcf8a3e5d791e9c16e683d9ae50cc6c680c936fc314c354f1e94b0b57"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/weedonandscott/trolley/releases/download/v#{version}/trolley-cli-aarch64-linux.tar.xz"
      sha256 "5ba70191babe571c2187b1032d69207253cbe6f7ae97c136be71da8b213275d5"
    else
      url "https://github.com/weedonandscott/trolley/releases/download/v#{version}/trolley-cli-x86_64-linux.tar.xz"
      sha256 "22275d339c9f2bd2ed192ce44769e31b265c19aa94518f2383befbf796fa398b"
    end
  end

  def install
    bin.install "trolley"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trolley --version")
  end
end
