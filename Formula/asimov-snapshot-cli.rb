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

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert true
  end
end
