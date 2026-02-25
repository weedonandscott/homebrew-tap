class Trolley < Formula
  desc "Terminal workspace manager powered by Ghostty"
  homepage "https://github.com/weedonandscott/trolley"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/weedonandscott/trolley/releases/download/v#{version}/trolley-cli-aarch64-macos.tar.xz"
      sha256 "e40024ec516e41ec14044fa9bbf718cb5a70394439b403cb1803f8440d1b0eff"
    else
      url "https://github.com/weedonandscott/trolley/releases/download/v#{version}/trolley-cli-x86_64-macos.tar.xz"
      sha256 "57c44b84504fede26aa0e7df65017ed35c85ad997e75c89dcacb54bb29af6b68"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/weedonandscott/trolley/releases/download/v#{version}/trolley-cli-aarch64-linux.tar.xz"
      sha256 "be8af7497c229e616bcde921eb9b51444a18ae9969197815bb3ff320e57d16dc"
    else
      url "https://github.com/weedonandscott/trolley/releases/download/v#{version}/trolley-cli-x86_64-linux.tar.xz"
      sha256 "50676d21379519ab524b88887b4be172faae2d4e3826469121e41533271cdc7e"
    end
  end

  def install
    bin.install "trolley"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trolley --version")
  end
end
