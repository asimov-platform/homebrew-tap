class AsimovCli < Formula
  desc "To Be Filled"
  homepage "https://github.com/asimov-platform/asimov-cli"
  url "https://github.com/asimov-platform/asimov-cli/archive/refs/tags/25.9.1.tar.gz"
  sha256 "65ebd451d55125712af3c11d44d861227b82f60f01eee09e2b04f95893f4a11e"
  license "Unlicense"
  head "https://github.com/asimov-platform/asimov-cli.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://ghcr.io/v2/asimov-platform/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "78e2519ee850a7c2a79b1c7f2d720256a0438f353a989fc79c436fd52aaf5190"
    sha256 cellar: :any,                 x86_64_linux:  "83cc331cc99801c96034edcd2ea3419c13ee60fb3f6ce1e5ff30527dd752714a"
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
