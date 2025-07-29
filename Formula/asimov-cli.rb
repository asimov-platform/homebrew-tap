class AsimovCli < Formula
  desc "To Be Filled"
  homepage "https://github.com/asimov-platform/asimov-cli"
  url "https://github.com/asimov-platform/asimov-cli/archive/refs/tags/25.0.0-dev.9.tar.gz"
  sha256 "d9a78daf90f335f5e3c16c3ddb43c3fdac7082a565804810b4837d532ff47cca"
  license "Unlicense"
  head "https://github.com/asimov-platform/asimov-cli.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://ghcr.io/v2/asimov-platform/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "05b4d6994cf4d369be507e32e9e16dac21f7b61b5a311b0c9528c212de857429"
    sha256 cellar: :any_skip_relocation, ventura:       "530a630a8bb1386bc40ba385883f91fbdc4c7acc8eadb7aa0197ed93eacb22f8"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "0f69f08e7cfa82a3530c52af6877fb7068c3d84da161addd712278efa6c065a4"
  end

  depends_on "rust" => :build
  depends_on "asimov-module-cli"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert true
  end
end
