class AsimovCli < Formula
  desc "To Be Filled"
  homepage "https://github.com/asimov-platform/asimov-cli"
  url "https://github.com/asimov-platform/asimov-cli/archive/refs/tags/25.7.0.tar.gz"
  sha256 "15c91e91720a6213de8ee227cc545317f5a1e4a9b504bf3690a1c9ef84ad7474"
  license "Unlicense"
  head "https://github.com/asimov-platform/asimov-cli.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://ghcr.io/v2/asimov-platform/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "abaf74e82f0f341594a34237f59859ec0dd538e98f42d5a83f74b80c4d337dfd"
    sha256 cellar: :any,                 x86_64_linux:  "e0bcd0e276106d4bfebdf7e4911c1ab0cf8d7a9569253f8329db840c66c9ea65"
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
