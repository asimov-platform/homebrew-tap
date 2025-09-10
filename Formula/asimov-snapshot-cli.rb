class AsimovSnapshotCli < Formula
  desc "To Be Filled"
  homepage "https://github.com/asimov-platform/asimov-snapshot-cli"
  url "https://github.com/asimov-platform/asimov-snapshot-cli/archive/refs/tags/25.0.0-dev.2.tar.gz"
  sha256 "4cd9ac1db9a9597d128518d744bce9c23c4b120dd225080f61b71db4f8308004"
  license "Unlicense"
  head "https://github.com/asimov-platform/asimov-snapshot-cli.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://ghcr.io/v2/asimov-platform/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0434456894aa684a85170539e6469b929119456ee196a3b132259038cb18ccd4"
    sha256 cellar: :any_skip_relocation, ventura:       "8e54faf03b45dd8c299be4a31b4eb3e11a4d9c93839f0dc26c1681c698e09e18"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "28ffd9c6758e08c8ec00a93a702831686ee1f2663c576629b13d6a9003501b41"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert true
  end
end
