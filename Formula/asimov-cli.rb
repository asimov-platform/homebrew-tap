class AsimovCli < Formula
  desc "To Be Filled"
  homepage "https://github.com/asimov-platform/asimov-cli"
  url "https://github.com/asimov-platform/asimov-cli/archive/refs/tags/25.4.0.tar.gz"
  sha256 "5f308341f2cc17bc5cdddc7458c037df6ac82dcb05350db93a97e50fdca8e58d"
  license "Unlicense"
  head "https://github.com/asimov-platform/asimov-cli.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://ghcr.io/v2/asimov-platform/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "6539cfd8d1046469041efe1a7c14a4d8f67f28d60c475e08a8b1281727edbbc5"
    sha256 cellar: :any,                 x86_64_linux:  "6e2bcc634494095b6cf8984adfff1a59dcfc5d90f4fbc0331c0217181a2b7b22"
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
