class AsimovModuleCli < Formula
  desc "To Be Filled"
  homepage "https://github.com/asimov-platform/asimov-module-cli"
  url "https://github.com/asimov-platform/asimov-module-cli/archive/refs/tags/25.0.0-dev.9.tar.gz"
  sha256 "6730b73eb4b81884697c5188767a47e0f53b211740447d062819d6e625a6f672"
  license "Unlicense"
  head "https://github.com/asimov-platform/asimov-module-cli.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://ghcr.io/v2/asimov-platform/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "4d6e9edf4c279842cbdacd1ca2e7d0e5f30b4e22ad935273a3887761c6055fee"
    sha256 cellar: :any_skip_relocation, ventura:       "7b3146df00e15683e22a9a9ac2a737a1509f484ff226b94d5ef96fc4f40b821c"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "d1c993234b8427d3980b64effebb7ce01731a2b0d72cdf13885999ed99a72bbb"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert true
  end
end
