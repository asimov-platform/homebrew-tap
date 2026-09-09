class AsimovCli < Formula
  desc "To Be Filled"
  homepage "https://github.com/asimov-platform/asimov-cli"
  url "https://github.com/asimov-platform/asimov-cli/archive/refs/tags/25.4.3.tar.gz"
  sha256 "e5049dc4374cb6e080715a79e08f27c816f770bd6ad585118979a33b5a7a2fd0"
  license "Unlicense"
  head "https://github.com/asimov-platform/asimov-cli.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://ghcr.io/v2/asimov-platform/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f09467aa96354a9114fa4cdc110a02b27446407281a2f8d590e36601e9418605"
    sha256 cellar: :any,                 x86_64_linux:  "eeb99426caf5a755395610cb944327e212c10de7874cefd8b3f95f65df41a778"
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
