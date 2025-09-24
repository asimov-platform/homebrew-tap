class AsimovModuleCli < Formula
  desc "To Be Filled"
  homepage "https://github.com/asimov-platform/asimov-module-cli"
  url "https://github.com/asimov-platform/asimov-module-cli/archive/refs/tags/25.0.0-dev.10.tar.gz"
  sha256 "a1e498b3b31d0a945a2f4df6bf53f9629cadb43179eed57b4abb120417fa6686"
  license "Unlicense"
  head "https://github.com/asimov-platform/asimov-module-cli.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://ghcr.io/v2/asimov-platform/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "44589bb2ee794b2ec594898529db497802bccb7dcb989867e6c4282d78f318aa"
    sha256 cellar: :any_skip_relocation, sequoia:       "20635402ea3f6436d39936ef8d1d2be3b5fc8ecacecf1f2f06b46b1ec2bf72b1"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "fd62c766936e83355043e6ea10bda0761614a32885fa5ebb9e1be9e0821da115"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert true
  end
end
