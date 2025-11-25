class AsimovCli < Formula
  desc "To Be Filled"
  homepage "https://github.com/asimov-platform/asimov-cli"
  url "https://github.com/asimov-platform/asimov-cli/archive/refs/tags/25.0.2.tar.gz"
  sha256 "75c0edd16608aba7fab26ece4f398b0df4e74da94b4a8626be2556c214b42db0"
  license "Unlicense"
  head "https://github.com/asimov-platform/asimov-cli.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://ghcr.io/v2/asimov-platform/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "3460cfa0b803e206b303fa5e73831233a9cf7514aff7a616943b6d1267e96d25"
    sha256 cellar: :any_skip_relocation, sequoia:       "0beb92dc004c2355562e02be4f9854ffe740b134fca5e0fa98e694ad52dd6e6e"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "941e58450a3b90471858b622e1a808f89fed0b31c3d73248943009cf1e715583"
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
