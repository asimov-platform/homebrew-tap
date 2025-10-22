class AsimovCli < Formula
  desc "To Be Filled"
  homepage "https://github.com/asimov-platform/asimov-cli"
  url "https://github.com/asimov-platform/asimov-cli/archive/refs/tags/25.0.0-dev.13.tar.gz"
  sha256 "d663243ca6cf7f94467697323ed6f762b54977410ac61aa0476a868909467d71"
  license "Unlicense"
  head "https://github.com/asimov-platform/asimov-cli.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://ghcr.io/v2/asimov-platform/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "5defc6e12ee9fb381d85ab30ebe49b56ed6023a3527d95b2114d757edd92d0eb"
    sha256 cellar: :any_skip_relocation, sequoia:       "ec63642bb88cc06382eba196fb65c6d52fcdd78b9d846e009f7c5aea05a2b698"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "e866869c85f735d925077cedfe0cfe9d43f98074710fc505580dbd64df9d9147"
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
