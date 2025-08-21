class AsimovCli < Formula
  desc "To Be Filled"
  homepage "https://github.com/asimov-platform/asimov-cli"
  url "https://github.com/asimov-platform/asimov-cli/archive/refs/tags/25.0.0-dev.11.tar.gz"
  sha256 "21a06536b826ee34e76e2cc4f34cc3474a7b2fe1a743a1ee16ec6d29896222bc"
  license "Unlicense"
  head "https://github.com/asimov-platform/asimov-cli.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://ghcr.io/v2/asimov-platform/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ecd811be51f54abd317120251da655d465cb2a0d0983c6e6e10b7d0573a433df"
    sha256 cellar: :any_skip_relocation, ventura:       "7307e7e12563a0065b7f750b04b0ea4372d03f778f9ea69af520a4ed3594d418"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "12094cd168601ab1ba648500ab0d69b8579a87cae724de1b64a9636c2dc3faae"
  end

  depends_on "rust" => :build
  depends_on "asimov-module-cli"
  depends_on "asimov-snapshot-cli"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert true
  end
end
