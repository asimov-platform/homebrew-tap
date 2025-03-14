class AsimovCli < Formula
  desc "ASIMOV Command-Line Interface (CLI)"
  homepage "https://github.com/asimov-platform/asimov-cli"
  version "25.0.0-dev.3"

  on_macos do
    if Hardware::CPU.arm?
      # macOS ARM
      url "https://github.com/asimov-platform/asimov-cli/releases/download/#{version}/asimov-macos-arm.gz"
      sha256 "c89a0660b1d091c332f6cf1611fe6f9021c8ed48948f2c43e2b05dfeb7afc8de"
    else
      # macOS Intel
      url "https://github.com/asimov-platform/asimov-cli/releases/download/#{version}/asimov-macos-x86.gz"
      sha256 "f2620190d96c1d929ce1c43d6e7f6ba751b32b3000d6419c5f032e4e23a2dc3e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      # Linux ARM
      url "https://github.com/asimov-platform/asimov-cli/releases/download/#{version}/asimov-linux-arm-gnu.gz"
      sha256 "2761b82936598588b7266d6d63abd1271e57d087c14f382f1ab15e523973c3e5"
    else
      # Linux Intel
      url "https://github.com/asimov-platform/asimov-cli/releases/download/#{version}/asimov-linux-x86-gnu.gz"
      sha256 "0c30685a1b814364c17a70b629e3b94a24bec0c66c1943bd324cf56b57980326"
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
