class AsimovCli < Formula
  desc "To Be Filled"
  homepage "https://github.com/asimov-platform/asimov-cli"
  url "https://github.com/asimov-platform/asimov-cli/archive/refs/tags/25.7.2.tar.gz"
  sha256 "eb8290c213fb15bf38cab8ea53843e17c83b1274d6a08d63b1d8d577b3d1e150"
  license "Unlicense"
  head "https://github.com/asimov-platform/asimov-cli.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://ghcr.io/v2/asimov-platform/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "7ad99c3f8b7150ad7ca7a84a8d162502e62f2af4210fd8e8fb641b2537481969"
    sha256 cellar: :any,                 x86_64_linux:  "7ff701a34ca47e32a5fc689dc1cfe7b70c1803169118db5e86643b0bfc3dc252"
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
