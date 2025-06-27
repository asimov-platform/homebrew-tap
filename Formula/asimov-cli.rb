class AsimovCli < Formula
  desc "ASIMOV Command-Line Interface (CLI)"
  homepage "https://github.com/asimov-platform/asimov-cli"
  url "https://github.com/asimov-platform/asimov-cli/archive/refs/tags/25.0.0-dev.6.tar.gz"
  version "25.0.0-dev.6"
  sha256 "4d8c5e79cd5ea3fb85f892b66e5bed926d708e722a1ec168f56b7b1c9c94a00a"
  license "Unlicense"
  head "https://github.com/asimov-platform/asimov-cli.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://ghcr.io/v2/asimov-platform/tap"
    rebuild 2
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a454e8779c2458dafd092dfd2551c3b742a89cb841d0f3413a90622ade2a13c2"
    sha256 cellar: :any_skip_relocation, ventura:       "e92d07e9fb5d7e382b7bf633d4f9e3cf68f0075c7ebc3501374ee2a6d22660c4"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "7a475d8eefdbdf7ca68808585883d7a21b0bc72e7046be244d6a16fc4ad17adb"
  end

  depends_on "rust" => :build
  depends_on "openssl@3"

  on_macos do
    on_arm do
      resource "asimov-dataset" do
        url "https://github.com/asimov-platform/asimov-dataset-cli/releases/download/25.0.0-dev.6/asimov-dataset-cli-macos-arm.gz"
        sha256 "d2f99004bf815f339f2e27f3f6b4f85f682ce48a4ca0cdb8a5614a07a0afd549"
      end
      resource "asimov-module" do
        url "https://github.com/asimov-platform/asimov-module-cli/releases/download/25.0.0-dev.4/asimov-module-cli-macos-arm.gz"
        sha256 "6339345d9b921278fc1c50acdd6e19041b0b466c620ec7ed8358c7ade3c79ab4"
      end
      # resource "asimov-repository" do
      #   url "https://github.com/asimov-platform/asimov-repository-cli/releases/download/25.0.0-dev.1/asimov-repository-cli-macos-arm.gz"
      #   sha256 "64941269d9bcd8a19c2b00877da71e252ddf9f05a7ccdcfc3fa79eb02b9b4ce0"
      # end
    end

    on_intel do
      resource "asimov-dataset" do
        url "https://github.com/asimov-platform/asimov-dataset-cli/releases/download/25.0.0-dev.6/asimov-dataset-cli-macos-x86.gz"
        sha256 "89c952284188d493d62b0acec6c67313b1a3d05cca16042e4510173cafeebfb0"
      end
      resource "asimov-module" do
        url "https://github.com/asimov-platform/asimov-module-cli/releases/download/25.0.0-dev.4/asimov-module-cli-macos-x86.gz"
        sha256 "e7ea58e088ad196ff21f8f59e5e888f57bc4d0a285a8dfcc6f50eb72eb2020dd"
      end
      # resource "asimov-repository" do
      #   url "https://github.com/asimov-platform/asimov-repository-cli/releases/download/25.0.0-dev.1/asimov-repository-cli-macos-x86.gz"
      #   sha256 "501c312b5bfce96bba454591e3fcae3735d2dcc743bfdfbd11896fc517c97f21"
      # end
    end
  end

  on_linux do
    on_intel do
      resource "asimov-dataset" do
        url "https://github.com/asimov-platform/asimov-dataset-cli/releases/download/25.0.0-dev.6/asimov-dataset-cli-linux-x86-gnu.gz"
        sha256 "f154eac9ae686cfea8d5e72b5ca96c45f77ac50e7585ca09c53e4306954044e5"
      end
      resource "asimov-module" do
        url "https://github.com/asimov-platform/asimov-module-cli/releases/download/25.0.0-dev.4/asimov-module-cli-linux-x86-gnu.gz"
        sha256 "ddc1230e42518086488121fdff3a356bbd1f9852b9a7d3cd3e0698697188a2f5"
      end
      # resource "asimov-repository" do
      #   url "https://github.com/asimov-platform/asimov-repository-cli/releases/download/25.0.0-dev.1/asimov-repository-cli-linux-x86-gnu.gz"
      #   sha256 "cf0e9a64019060dced69553f2805772377299000092bd97ed32b7b6c6d924a8d"
      # end
    end
  end

  def install
    system "cargo", "install", *std_cargo_args

    # Process each resource
    resources.each do |r|
      r.stage do
        bin.install r.name
      end
    end
  end

  test do
    system bin/"asimov", "--version"

    # Test that all resources exist
    resources.each do |r|
      assert_path_exists bin/r.name
    end
  end
end
