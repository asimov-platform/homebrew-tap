class AsimovCli < Formula
  desc "To Be Filled"
  homepage "https://github.com/asimov-platform/asimov-cli"
  url "https://github.com/asimov-platform/asimov-cli/archive/refs/tags/25.6.1.tar.gz"
  sha256 "850370b91fe09c564042b6ed26fdee4b14b64d12a03446aa7a5c26c486c86238"
  license "Unlicense"
  head "https://github.com/asimov-platform/asimov-cli.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://ghcr.io/v2/asimov-platform/tap"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "b31166e114b62a6ac954298687155fc72bc91435724f9f47e81e5f44c284b717"
    sha256 cellar: :any,                 x86_64_linux:  "ab22fb7273fbf8c5445a090483e73873b7a55903c75838ee911576db60bcd466"
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
