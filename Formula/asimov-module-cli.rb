class AsimovModuleCli < Formula
  desc "To Be Filled"
  homepage "https://github.com/asimov-platform/asimov-module-cli"
  url "https://github.com/asimov-platform/asimov-module-cli/archive/refs/tags/25.0.3.tar.gz"
  sha256 "a74b83592c87310f648e5a542644fa6db99c5d8d47718be6d9f7fc2e165420c1"
  license "Unlicense"
  head "https://github.com/asimov-platform/asimov-module-cli.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://ghcr.io/v2/asimov-platform/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "b914ea8ed0de1aa99bb727a6c69d01d8fc8ae726f34d19922c446733b4a7428c"
    sha256 cellar: :any_skip_relocation, sequoia:       "13b496db983c3a9f728997a5dbdb012ded3e949ab1fdea62216bdf3bcc5a3dbf"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "03d52d72ccfb70b262e78303db3daceb86e3bad1962274e02a3c638b88f71c32"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert true
  end
end
