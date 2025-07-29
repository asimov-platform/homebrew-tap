class AsimovModuleCli < Formula
  desc "To Be Filled"
  homepage "https://github.com/asimov-platform/asimov-module-cli"
  url "https://github.com/asimov-platform/asimov-module-cli/archive/refs/tags/25.0.0-dev.7.tar.gz"
  sha256 "b45e88d7a750f98e83f4aa9d169b4458978ef59ce391b6be7919253a9f7a8721"
  license "Unlicense"
  head "https://github.com/asimov-platform/asimov-module-cli.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://ghcr.io/v2/asimov-platform/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "05f42fde724ef9f3a0f0e3514781555d153c334beb3df1095d172061daf0d903"
    sha256 cellar: :any_skip_relocation, ventura:       "a24eed656d711e516a79a50c8b1c1cab77d07407b9f4889fd4cdb85b6c6aeeb7"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "1c895e0208b53365cd5389cddc58fb998e955f668426845716845657da68c95d"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert true
  end
end
