class AsimovCli < Formula
  desc "To Be Filled"
  homepage "https://github.com/asimov-platform/asimov-cli"
  url "https://github.com/asimov-platform/asimov-cli/archive/refs/tags/25.8.0.tar.gz"
  sha256 "f9a6f3ffb3829a9135208d579eb76320101b6840a3c3a3bbe50c9f9318eee515"
  license "Unlicense"
  head "https://github.com/asimov-platform/asimov-cli.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://ghcr.io/v2/asimov-platform/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "5a6b78532f41bb45e463f1b404f5d8cd74d63645d6d4e400f93e0674e6b750f0"
    sha256 cellar: :any,                 x86_64_linux:  "5098d0b2614070916ab0878eec857a2779afa360f288f18534875d880d6dcd03"
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
