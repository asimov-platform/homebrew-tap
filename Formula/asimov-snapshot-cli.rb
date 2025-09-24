class AsimovSnapshotCli < Formula
  desc "To Be Filled"
  homepage "https://github.com/asimov-platform/asimov-snapshot-cli"
  url "https://github.com/asimov-platform/asimov-snapshot-cli/archive/refs/tags/25.0.0-dev.3.tar.gz"
  sha256 "846f9fc28d458dde2aefc2d625315665cf635724d62b6a60627ae631e74fb193"
  license "Unlicense"
  head "https://github.com/asimov-platform/asimov-snapshot-cli.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://ghcr.io/v2/asimov-platform/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "cd3f43c092116dc5d5cef0154dee705eb2fd35fd34e0e4771a49ddb7c419600f"
    sha256 cellar: :any_skip_relocation, sequoia:       "2f64b60ec62c4e519455f72e673a3577180f5a678c71ea9830be8a829999aefe"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "fa24e0fddad064b68235ff608d752d9d8dde9af8c5cabec32044ce6b81e6d613"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert true
  end
end
