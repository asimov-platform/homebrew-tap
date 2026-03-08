class AsimovCli < Formula
  desc "To Be Filled"
  homepage "https://github.com/asimov-platform/asimov-cli"
  url "https://github.com/asimov-platform/asimov-cli/archive/refs/tags/25.1.0.tar.gz"
  sha256 "fdbe0b75ee89bda05fe1fa01b828b61a9b797fcde277a4978bc43e745142c277"
  license "Unlicense"
  head "https://github.com/asimov-platform/asimov-cli.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://ghcr.io/v2/asimov-platform/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f0ae9e88879973183bc9675ce4476a60b084a4b0b6029bdb6f54a5c1a324a78a"
    sha256 cellar: :any_skip_relocation, sequoia:       "2cf2f1cee380bb72d808431ad0e27bb1fee1f364c84a83167fcd5c4a469624bd"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "22a4a1b7faac332c7b0a642e4a5bb457c8156a114f05d12e67b0118abb91e943"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert true
  end
end
