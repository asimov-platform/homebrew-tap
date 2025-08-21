class AsimovModuleCli < Formula
  desc "To Be Filled"
  homepage "https://github.com/asimov-platform/asimov-module-cli"
  url "https://github.com/asimov-platform/asimov-module-cli/archive/refs/tags/25.0.0-dev.8.tar.gz"
  sha256 "78a3d01aafd20043d1cf77aaf33fa3842b589ae8bfe1f131b12e8a1f3f02a5e3"
  license "Unlicense"
  head "https://github.com/asimov-platform/asimov-module-cli.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://ghcr.io/v2/asimov-platform/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "64a17cbd352a06baac6a6ef3b7d7ba7e748487eeae39a79f46f56a8596434c41"
    sha256 cellar: :any_skip_relocation, ventura:       "93921add174f7897eebfb29c8e0f442b54a2fb08d2498b1d38aadc29bca8d696"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "7a02af481daebd4df26cda32789ac3472c44fb477a35dbcbfaed390d18462482"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert true
  end
end
