class AsimovCli < Formula
  desc "ASIMOV Command-Line Interface (CLI)"
  homepage "https://github.com/asimov-platform/asimov-cli"
  version "25.0.0-dev.2"

  on_macos do
    if Hardware::CPU.arm?
      # macOS ARM
      url "https://github.com/asimov-platform/asimov-cli/releases/download/#{version}/asimov-macos-arm.gz"
      sha256 "af05128473c3dfda48e7740d2a456a7996a6391ac46a3ef0620cb803afaeb793"
    else
      # macOS Intel
      url "https://github.com/asimov-platform/asimov-cli/releases/download/#{version}/asimov-macos-x86.gz"
      sha256 "332f2a586bb3d702db60b165f09b96a01995034a35ab109713d01ba53f0cb2cf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      # Linux ARM
      url "https://github.com/asimov-platform/asimov-cli/releases/download/#{version}/asimov-linux-arm.gz"
      sha256 "e9ca2393fe6147a01f10a36bd162b8f014fcfc1e964bb65a33e6d0920b34960d"
    else
      # Linux Intel
      url "https://github.com/asimov-platform/asimov-cli/releases/download/#{version}/asimov-linux-x86.gz"
      sha256 "a64251f846d0cc0280a7f83f25f0db0c4f15ef4caf349ccd45dad22250866060"
    end
  end

  def install
    system "gunzip", cached_download

    uncompressed = Pathname(cached_download.to_s.sub(/\.gz$/, ""))

    bin.install uncompressed => "asimov"
  end

  test do
    system "#{bin}/asimov", "--version"
  end
end
