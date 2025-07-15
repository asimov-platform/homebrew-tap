class AsimovCli < Formula
  desc "To Be Filled"
  homepage "https://github.com/asimov-platform/asimov-cli"
  url "https://github.com/asimov-platform/asimov-cli/archive/refs/tags/25.0.0-dev.8.tar.gz"
  sha256 "627db9880f3ebf9ed2368f2b36ae1fb77946ec766490a810b02d2accc4979673"
  license "Unlicense"
  head "https://github.com/asimov-platform/asimov-cli.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://ghcr.io/v2/asimov-platform/tap"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "fa03bec5504f60214f3316e76a502cd4b6377ece1cf3afa69f974c8c4e788dbf"
    sha256 cellar: :any_skip_relocation, ventura:       "69d0346cf5d438588938f65283b838dd20faf0aff7bf29fd41c18d39c004c981"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "de82aca6e85f6c23f976ed3fba07a903124af0f65402025dd7f5afe7cdbe0baa"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert true
  end
end
