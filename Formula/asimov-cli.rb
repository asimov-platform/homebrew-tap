class AsimovCli < Formula
  desc "To Be Filled"
  homepage "https://github.com/asimov-platform/asimov-cli"
  url "https://github.com/asimov-platform/asimov-cli/archive/refs/tags/25.1.1.tar.gz"
  sha256 "557f1f73c546af4f0590694c249ef532ac7cd3caa60b7bc8fec69ac0f0c77575"
  license "Unlicense"
  head "https://github.com/asimov-platform/asimov-cli.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://ghcr.io/v2/asimov-platform/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d34e05affec7e2fda78bfd25c042855c0331bd86a56c9c5f5de672d8eb140434"
    sha256 cellar: :any_skip_relocation, sequoia:       "ae77f5913159775dc21f4f2623734881fa4f1822ebfdf921883cec4e3db8acc0"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "b0470a84b74bba701d95375eccf261d6bd2c2306cc793aef5f1f79753726aff2"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert true
  end
end
