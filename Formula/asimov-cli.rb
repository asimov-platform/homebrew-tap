class AsimovCli < Formula
  desc "To Be Filled"
  homepage "https://github.com/asimov-platform/asimov-cli"
  url "https://github.com/asimov-platform/asimov-cli/archive/refs/tags/25.0.1.tar.gz"
  sha256 "22ca9943cef1e7443b82ad5e0a5d25daae77fd43e2a4edcfbf54fdf6ea81b0a8"
  license "Unlicense"
  head "https://github.com/asimov-platform/asimov-cli.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://ghcr.io/v2/asimov-platform/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "aad5fa08fb29e5bd446bbacd03aa828404d23b9879a8861594b266ba12d73d94"
    sha256 cellar: :any_skip_relocation, sequoia:       "c28e68d6de8569c5c4ce752f7d81f0b87d24d55095df9383d63c4f8091f41662"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "165ef45352d7ce6b3d4c19619dc57a11dcc9654a26dd2d9a5618da24ef9f444f"
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
