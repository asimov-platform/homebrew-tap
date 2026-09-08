class AsimovCli < Formula
  desc "To Be Filled"
  homepage "https://github.com/asimov-platform/asimov-cli"
  url "https://github.com/asimov-platform/asimov-cli/archive/refs/tags/25.4.2.tar.gz"
  sha256 "ba7117256c85d764c81493b6e4f6a13109009f2fe844686698a9d698e6676212"
  license "Unlicense"
  head "https://github.com/asimov-platform/asimov-cli.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://ghcr.io/v2/asimov-platform/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "4ac14abdb85dc7e12995ed481fd2a6fe2b7a10003fd51bac88c602a4256c50e7"
    sha256 cellar: :any,                 x86_64_linux:  "162ba2ca4437f6e76c55a5994c89c7f808c19dcdde22912f4a124d180d1f22c9"
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
