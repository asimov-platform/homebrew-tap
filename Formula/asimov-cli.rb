class AsimovCli < Formula
  desc "To Be Filled"
  homepage "https://github.com/asimov-platform/asimov-cli"
  url "https://github.com/asimov-platform/asimov-cli/archive/refs/tags/25.4.1.tar.gz"
  sha256 "c5ef2f087e39f77532f171d1c9f310de5fd12916f97cf162b123cf64af2cb2f9"
  license "Unlicense"
  head "https://github.com/asimov-platform/asimov-cli.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://ghcr.io/v2/asimov-platform/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "b76cefa94e51cbc8e7c4826b60a105242f738247610f4173568282060dc7aa97"
    sha256 cellar: :any,                 x86_64_linux:  "a84acad8f1e26e57763df72c9b19a499cbfe8cee3e38aa64b97c6ed1f6b91a8c"
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
