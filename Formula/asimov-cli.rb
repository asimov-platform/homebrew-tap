class AsimovCli < Formula
  desc "To Be Filled"
  homepage "https://github.com/asimov-platform/asimov-cli"
  url "https://github.com/asimov-platform/asimov-cli/archive/refs/tags/25.7.5.tar.gz"
  sha256 "a8237db6ff26d1ddb7007776b859b4b2645fc0f5920849046ea072e1a36bf769"
  license "Unlicense"
  head "https://github.com/asimov-platform/asimov-cli.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://ghcr.io/v2/asimov-platform/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "3be3492538e583943c2f80db650781111b723e39f7c43fe1d3cf80a8b4bfbb69"
    sha256 cellar: :any,                 x86_64_linux:  "d3e2075ea465cb801b66f67a188378409d453801af50d5f9224c222361d4fd7b"
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
