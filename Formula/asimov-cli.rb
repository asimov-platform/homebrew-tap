class AsimovCli < Formula
  desc "ASIMOV Command-Line Interface (CLI)"
  homepage "https://github.com/asimov-platform/asimov-cli"
  url "https://github.com/asimov-platform/asimov-cli/archive/refs/tags/25.0.0-dev.7.tar.gz"
  version "25.0.0-dev.7"
  sha256 "b302fb69ab96339257ce05b88deafd29bbb20a1457d1d6bae89c6a1e522a241d"
  license "Unlicense"
  head "https://github.com/asimov-platform/asimov-cli.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://ghcr.io/v2/asimov-platform/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "6d9c39f78143f5b3f2ba5150da6dea924b4183f3ca7250958ee837970ae1c897"
    sha256 cellar: :any_skip_relocation, ventura:       "560491cc3bc1d80548c605433ed058a8880bd8231f15ec26e90950fd414996ec"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "db94bb7ee6d9d046b3fafcb9dd2eff6d0d67a97f8143a20367f9f766e33448e2"
  end

  depends_on "rust" => :build
  depends_on "asimov-module-cli"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"asimov", "--version"
  end
end
