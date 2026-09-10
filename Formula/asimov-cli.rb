class AsimovCli < Formula
  desc "To Be Filled"
  homepage "https://github.com/asimov-platform/asimov-cli"
  url "https://github.com/asimov-platform/asimov-cli/archive/refs/tags/25.5.0.tar.gz"
  sha256 "fbc47269b5aefa3052ee5b92d2499d70a9474cf347f4086c2856441c22db72b4"
  license "Unlicense"
  head "https://github.com/asimov-platform/asimov-cli.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://ghcr.io/v2/asimov-platform/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "127cc5caaeeaf6f35ba1f419f2b1b9660ae4174111429cccc0d8d2373169a564"
    sha256 cellar: :any,                 x86_64_linux:  "c368b3db7bb5019f0919ed0db955e077e5349c7bc58fc3f4e2c35cd8f5b15764"
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
