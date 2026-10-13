class AsimovCli < Formula
  desc "To Be Filled"
  homepage "https://github.com/asimov-platform/asimov-cli"
  url "https://github.com/asimov-platform/asimov-cli/archive/refs/tags/25.7.4.tar.gz"
  sha256 "8d3352c9733fd0531d588c447290036f06738237c804cc4233da34cb7dd1ee99"
  license "Unlicense"
  head "https://github.com/asimov-platform/asimov-cli.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://ghcr.io/v2/asimov-platform/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1a023cf7aa2ff9aba1d8f8b35b8355b99e005e090994df493aeff07db6c7d816"
    sha256 cellar: :any,                 x86_64_linux:  "0f3b67611fcac81cdd4a31a5179ce9d7d5c656fbf991c93fc4016bbb46805dff"
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
