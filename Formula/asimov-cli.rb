class AsimovCli < Formula
  desc "To Be Filled"
  homepage "https://github.com/asimov-platform/asimov-cli"
  url "https://github.com/asimov-platform/asimov-cli/archive/refs/tags/25.7.3.tar.gz"
  sha256 "c7a58928935bb5028d8a8ebf7db2ba42f16caf7bc056925a7ba672d7b15061ef"
  license "Unlicense"
  head "https://github.com/asimov-platform/asimov-cli.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://ghcr.io/v2/asimov-platform/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "bfb858aca414227317547898c87718648a596625b28aacfaccdba6d3af437343"
    sha256 cellar: :any,                 x86_64_linux:  "63fdb3e28e53c7f66b28a73817f7a4fa70ee9fa4f1077d51c087ae6c7be80627"
  end

  depends_on "rust" => :build
  depends_on "openssl@3" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert true
  end
end
