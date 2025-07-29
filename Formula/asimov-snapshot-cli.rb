class AsimovSnapshotCli < Formula
  desc "To Be Filled"
  homepage "https://github.com/asimov-platform/asimov-snapshot-cli"
  url "https://github.com/asimov-platform/asimov-snapshot-cli/archive/refs/tags/25.0.0-dev.1.tar.gz"
  sha256 "50d0cfbd7a3154939e8c4037a446003ca6ba2a586a1905a54c1bfdf0de7081ea"
  license "Unlicense"
  head "https://github.com/asimov-platform/asimov-snapshot-cli.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://ghcr.io/v2/asimov-platform/tap"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "3fb59fc07bc7f774510c52add8e32f9a3da94715e65babdc53c5a93f95f85f9c"
    sha256 cellar: :any_skip_relocation, ventura:       "a118e93409e94dd2d4d2d3c17d914217416f74e90cc593e67a30702d0fca3382"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "03f100b03b58c347133b7ed407160078b7744b600c2c11262271eed568465273"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert true
  end
end
