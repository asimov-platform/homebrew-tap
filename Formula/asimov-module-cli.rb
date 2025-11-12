class AsimovModuleCli < Formula
  desc "To Be Filled"
  homepage "https://github.com/asimov-platform/asimov-module-cli"
  url "https://github.com/asimov-platform/asimov-module-cli/archive/refs/tags/25.0.1.tar.gz"
  sha256 "16c1c2e6f746f4865ad412a94262f7c4d84536e5ef4be15d3477b9abbdf61f40"
  license "Unlicense"
  head "https://github.com/asimov-platform/asimov-module-cli.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://ghcr.io/v2/asimov-platform/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d0f2f2e1f54b0689ff3a4cf0f9c70712268f932f72c8a0e9f542355db9e3c02a"
    sha256 cellar: :any_skip_relocation, sequoia:       "77b00ff2c243795c5d65951c9b484414e3e42710a3eb9c1bd2143000733a47b1"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "e74b2eb5de3a1c001cad5fd175d372892df840d7609fc3287f1c4bdf2f6ca165"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert true
  end
end
