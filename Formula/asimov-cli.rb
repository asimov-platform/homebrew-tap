class AsimovCli < Formula
  desc "To Be Filled"
  homepage "https://github.com/asimov-platform/asimov-cli"
  url "https://github.com/asimov-platform/asimov-cli/archive/refs/tags/25.3.0.tar.gz"
  sha256 "391074cd00e88ebf9a1f50746f52db74bff9b3592beb4712737cd9f1c20bb406"
  license "Unlicense"
  head "https://github.com/asimov-platform/asimov-cli.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://ghcr.io/v2/asimov-platform/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "781202070ee370ee6112b144c06bd3f2876cd5f2327006b26d480b24f73a354e"
    sha256 cellar: :any_skip_relocation, sequoia:       "45944d4585d2c36df16f7bd5d521e32eb5eb453f2898878b4381ecbdb508a0cb"
    sha256 cellar: :any,                 x86_64_linux:  "ee3c0be21a364f2f06a2f556d4568a7ee9709494ecebcf377a2f81ca73e92ee5"
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
