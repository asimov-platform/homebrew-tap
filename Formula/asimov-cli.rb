class AsimovCli < Formula
  desc "ASIMOV Command-Line Interface (CLI)"
  homepage "https://github.com/asimov-platform/asimov-cli"
  version "25.0.0-dev.4"

  on_macos do
    if Hardware::CPU.arm?
      # macOS ARM
      url "https://github.com/asimov-platform/asimov-cli/releases/download/#{version}/asimov-macos-arm.gz"
      sha256 "e67ec61334647909fa1d405498ca42a6e7a9a96471a435ec5bbb7dc784c08ce4"
    else
      # macOS Intel
      url "https://github.com/asimov-platform/asimov-cli/releases/download/#{version}/asimov-macos-x86.gz"
      sha256 "eaaa532d63de98905367816b5ec6fad87815d2911d6d57bf7ddeec446f36bec5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      # Linux ARM
      url "https://github.com/asimov-platform/asimov-cli/releases/download/#{version}/asimov-linux-arm-gnu.gz"
      sha256 "ef21144725eeccd0618357f0bb4936d1653a8968bfa8b530fa2490685470dc33"
    else
      # Linux Intel
      url "https://github.com/asimov-platform/asimov-cli/releases/download/#{version}/asimov-linux-x86-gnu.gz"
      sha256 "6b6e54fd490e036d864158de7d4b19a248aaf64c926ff9d3daa9db0f463d6f9c"
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
