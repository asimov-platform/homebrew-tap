class AsimovCli < Formula
  desc "To Be Filled"
  homepage "https://github.com/asimov-platform/asimov-cli"
  url "https://github.com/asimov-platform/asimov-cli/archive/refs/tags/25.9.0.tar.gz"
  sha256 "422606e03974f06e18f9ab3fe666d813014aceb24a2f1a51b32be765f8234133"
  license "Unlicense"
  head "https://github.com/asimov-platform/asimov-cli.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://ghcr.io/v2/asimov-platform/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "cba563e7ae115cb0f43610c037944bad56f6baa409778d645ccd8e73c5842b46"
    sha256 cellar: :any,                 x86_64_linux:  "668ca6c13c7834f753dabcc06cea1b4348958041571dc9ff50a315ebf9863955"
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
