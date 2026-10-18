class AsimovCli < Formula
  desc "To Be Filled"
  homepage "https://github.com/asimov-platform/asimov-cli"
  url "https://github.com/asimov-platform/asimov-cli/archive/refs/tags/25.8.1.tar.gz"
  sha256 "747e0a23426da81183e7290fbf06b4574cc17df1c5deae34cbf47190216cdf9d"
  license "Unlicense"
  head "https://github.com/asimov-platform/asimov-cli.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://ghcr.io/v2/asimov-platform/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ff90db99b6690202fcde56c240b14c6b9c6be105722055ccef35e69f7148b990"
    sha256 cellar: :any,                 x86_64_linux:  "7fcecd8d86a3d247e75f43b1e27aba4da14b7e1b62fd50f9c3c8d9dc95c62ffa"
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
