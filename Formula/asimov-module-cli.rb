class AsimovModuleCli < Formula
  desc "To Be Filled"
  homepage "https://github.com/asimov-platform/asimov-module-cli"
  url "https://github.com/asimov-platform/asimov-module-cli/archive/refs/tags/25.0.0.tar.gz"
  sha256 "5d63f66f40f045134ecc0b9d9edd220778660ffb9aeffae54cab5d108f44a257"
  license "Unlicense"
  head "https://github.com/asimov-platform/asimov-module-cli.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://ghcr.io/v2/asimov-platform/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "de9bef6186a36d71dc018da4f359e4c30d6abd1ea52a7deed7c2b4ba776cc0b6"
    sha256 cellar: :any_skip_relocation, sequoia:       "44795c7624fa3bc977ffdb96f106a7c4b22c83b677e90897715d14905d519980"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "f78a5bfc23d5009d2765f2dad8cdf7878f8959e5f9a4a3c232b1f50ef787fd65"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert true
  end
end
