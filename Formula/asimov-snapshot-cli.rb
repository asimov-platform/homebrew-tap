class AsimovSnapshotCli < Formula
  desc "To Be Filled"
  homepage "https://github.com/asimov-platform/asimov-snapshot-cli"
  url "https://github.com/asimov-platform/asimov-snapshot-cli/archive/refs/tags/25.0.0-dev.4.tar.gz"
  sha256 "e9b17ac680c2778580e1e9c45703250990da6b411da9c5c75b4a9be03fd2df5d"
  license "Unlicense"
  head "https://github.com/asimov-platform/asimov-snapshot-cli.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://ghcr.io/v2/asimov-platform/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "19c9c25077d78419ca06e89f629e0636fd88097bbbba5861bc600b87552f69b9"
    sha256 cellar: :any_skip_relocation, sequoia:       "1a9fdb31f94510187fb87121e39fbe1d065fe3d90b12933a7de2828c259c3ff6"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "081a1837ec174155bd0ff7c11f502e4de62aacaf2960e79e939d33579bbe17db"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert true
  end
end
