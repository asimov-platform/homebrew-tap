class AsimovModuleCli < Formula
  desc "To Be Filled"
  homepage "https://github.com/asimov-platform/asimov-module-cli"
  url "https://github.com/asimov-platform/asimov-module-cli/archive/refs/tags/25.0.0-dev.11.tar.gz"
  sha256 "b71e00c77d57c5d50f0e34e29043462a6652c6b321b78e62c7246318c3d342e9"
  license "Unlicense"
  head "https://github.com/asimov-platform/asimov-module-cli.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://ghcr.io/v2/asimov-platform/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "40435e17fc4339295e9ab378fad8e1bea33db67608e6b637429589c3e85780a8"
    sha256 cellar: :any_skip_relocation, sequoia:       "6bad8b91f3451b2bd0ea5f2541a53fdf45ea788432e07bdea170e00c21cb8fe4"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "accd1bb79596f8d68226497d019e3f0bfe481428d4ee8a5ef90f9118092d5379"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert true
  end
end
