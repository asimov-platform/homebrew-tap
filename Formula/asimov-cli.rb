class AsimovCli < Formula
  desc "To Be Filled"
  homepage "https://github.com/asimov-platform/asimov-cli"
  url "https://github.com/asimov-platform/asimov-cli/archive/refs/tags/25.0.3.tar.gz"
  sha256 "90e96f1ccd7bcd6ec1317d048e34e9037f1e411e570aed1c6161d0a0a7a360b0"
  license "Unlicense"
  head "https://github.com/asimov-platform/asimov-cli.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://ghcr.io/v2/asimov-platform/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "82a565c79da1fef652240525465f9f4aeb51fc0153c45bed9980b25758e52c28"
    sha256 cellar: :any_skip_relocation, sequoia:       "089a24dcd0a19b192d6ed26d3aefacb8d665ba004ff768b227019329b57b3a4c"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "cd518f346573d61e43c7ce9e342c1d10a445cf6032c407e1e154ca83b782904a"
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
