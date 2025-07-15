class AsimovModuleCli < Formula
  desc "To Be Filled"
  homepage "https://github.com/asimov-platform/asimov-module-cli"
  url "https://github.com/asimov-platform/asimov-module-cli/archive/refs/tags/25.0.0-dev.6.tar.gz"
  sha256 "d53c8b36ad2c32041ea136cd98db4ed48f15205a8f79cee26434c895301629ad"
  license "Unlicense"
  head "https://github.com/asimov-platform/asimov-module-cli.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://ghcr.io/v2/asimov-platform/tap"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "657aa84197cd02f87efc30e05a9b30bb94252f6f9142471bfab96a27c5bba4af"
    sha256 cellar: :any_skip_relocation, ventura:       "5cfa9cd1ad39a8b4639797c91e6f127177e0d13c23f618a0827472eecab38e79"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "1bba48c7f57756e63ef2a8db81e53c4937ad6bd4723448dbeda1fe24f8cff729"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert true
  end
end
