class AsimovCli < Formula
  desc "To Be Filled"
  homepage "https://github.com/asimov-platform/asimov-cli"
  url "https://github.com/asimov-platform/asimov-cli/archive/refs/tags/25.6.0.tar.gz"
  sha256 "c645a9886531935877e42c2b27bf237ac4b3da0b35751de6344a468513c2f4ed"
  license "Unlicense"
  head "https://github.com/asimov-platform/asimov-cli.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://ghcr.io/v2/asimov-platform/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "bc0ddffb89640875278610564591b1221804152f9e8dac242f60e0cdf75ef626"
    sha256 cellar: :any,                 x86_64_linux:  "6f4d3126c3c653d6747735482901c126110c5380f9c018f82ad6b0ef85e0ba40"
  end

  depends_on "rust" => :build
  depends_on "openssl@3" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert true
  end
end
