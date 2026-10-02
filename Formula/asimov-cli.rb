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
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "6c0961be3545ded4d19525067b693efb675ac2489143978fbac85b7635005126"
    sha256 cellar: :any,                 x86_64_linux:  "baf3eaf58872ea91b7c6507acb43050dbfc75a46e1d78c4c7eb2ced97988940a"
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
