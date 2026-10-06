class AsimovCli < Formula
  desc "To Be Filled"
  homepage "https://github.com/asimov-platform/asimov-cli"
  url "https://github.com/asimov-platform/asimov-cli/archive/refs/tags/25.7.1.tar.gz"
  sha256 "1a02c0d3f9137be85ac5be3cfe7b61bd4d866bc88891668907702ac2cfdfd1d4"
  license "Unlicense"
  head "https://github.com/asimov-platform/asimov-cli.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://ghcr.io/v2/asimov-platform/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "17d5595027b85a3ee9d2614e11f1d186fef53bf9bcdb1ce8a54048af157dc7f5"
    sha256 cellar: :any,                 x86_64_linux:  "289fbc59a5e981e9e54d3089b39d1e6a6ba4f418d60f6e05b160500adb42f04c"
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
