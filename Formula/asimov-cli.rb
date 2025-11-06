class AsimovCli < Formula
  desc "To Be Filled"
  homepage "https://github.com/asimov-platform/asimov-cli"
  url "https://github.com/asimov-platform/asimov-cli/archive/refs/tags/25.0.0.tar.gz"
  sha256 "58ff88f5f889ae016ca78ff44cde1af9f8641fb98543127ef707516e2477cc77"
  license "Unlicense"
  head "https://github.com/asimov-platform/asimov-cli.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://ghcr.io/v2/asimov-platform/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8e5b8fc10c713dbe74f85e4b6bd431747ff4b13c36b69083a322b9fb53e97107"
    sha256 cellar: :any_skip_relocation, sequoia:       "50e0aa5443bbb45948e1e500f4bfc4854b97b1ebf695dab6f3a25456490ee31d"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "c87694caf6dfccb1091aacde94570ee07720f349a1f459c3c9a7960c40e7af93"
  end

  depends_on "rust" => :build
  depends_on "asimov-module-cli"
  depends_on "asimov-snapshot-cli"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert true
  end
end
