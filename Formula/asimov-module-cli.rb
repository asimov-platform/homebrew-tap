class AsimovModuleCli < Formula
  desc "To Be Filled"
  homepage "https://github.com/asimov-platform/asimov-module-cli"
  url "https://github.com/asimov-platform/asimov-module-cli/archive/refs/tags/25.0.2.tar.gz"
  sha256 "c00d5c5860a63327118a0c453be4ebdb31163ac84d79c18ac8947d9cb3bfa8c0"
  license "Unlicense"
  head "https://github.com/asimov-platform/asimov-module-cli.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://ghcr.io/v2/asimov-platform/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d627576f1a4521eeb5745eea1062bb0effa5217599d22c9045f642278a665efc"
    sha256 cellar: :any_skip_relocation, sequoia:       "1e63b0e1a1b1c610054289fd9fcd1c1031b043745fa6fab1a1b2c8b9c897a100"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "bb2be0d68f154df85fdfd550743915cf9aba761e3ce35761d133a77174cdcfef"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert true
  end
end
