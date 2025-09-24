class AsimovCli < Formula
  desc "To Be Filled"
  homepage "https://github.com/asimov-platform/asimov-cli"
  url "https://github.com/asimov-platform/asimov-cli/archive/refs/tags/25.0.0-dev.12.tar.gz"
  sha256 "fd22b3f5fd6f4a311d5469b377658e7cf8ea3c753bbbc46b25120596db50d462"
  license "Unlicense"
  head "https://github.com/asimov-platform/asimov-cli.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://ghcr.io/v2/asimov-platform/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "fbdb2efabc26eb66f29d34b44055b473e952a9ebcb795ad01e0b5ff2f80e4aa8"
    sha256 cellar: :any_skip_relocation, sequoia:       "fc6e5d3dc8ff0188ea48e5b71a12023c44374fda18a0d57e0d2116df245e3684"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "ca33771b90233eccc517b63c5345bfb0c03c3f75c6ae10cba78d5e2c97175516"
  end

  depends_on "rust" => :build
  depends_on "asimov-module-cli"
  depends_on "asimov-snapshot-cli"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert true
  end
end
