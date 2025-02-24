class AsimovCli < Formula
  desc "Test Homebrew"
  homepage "https://github.com/asimov-platform/asimov-cli"
  license "Unlicense"
  version "4.1.4"

  livecheck do
    url :stable
    regex(/v?(\d+(?:\.\d+)+)/i)
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/asimov-platform/asimov-cli/releases/download/25.0.0-dev.2/asimov-macos-arm.gz"
      sha256 "af05128473c3dfda48e7740d2a456a7996a6391ac46a3ef0620cb803afaeb793"
    else
      url "https://github.com/asimov-platform/asimov-cli/releases/download/25.0.0-dev.2/asimov-macos-x86.gz"
      sha256 "332f2a586bb3d702db60b165f09b96a01995034a35ab109713d01ba53f0cb2cf"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/asimov-platform/asimov-cli/releases/download/25.0.0-dev.2/asimov-linux-arm.gz"
      sha256 "e9ca2393fe6147a01f10a36bd162b8f014fcfc1e964bb65a33e6d0920b34960d"
    else
      url "https://github.com/asimov-platform/asimov-cli/releases/download/25.0.0-dev.2/asimov-linux-x86.gz"
      sha256 "a64251f846d0cc0280a7f83f25f0db0c4f15ef4caf349ccd45dad22250866060"
    end
  end

  def install
    bin.install "asimov-cli"
  end

  test do
    system "#{bin}/asimov-cli", "--version"
  end
end
