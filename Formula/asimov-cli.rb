class AsimovCli < Formula
  desc "ASIMOV Command-Line Interface (CLI)"
  homepage "https://github.com/asimov-platform/asimov-cli"
  url "https://github.com/asimov-platform/asimov-cli/archive/refs/tags/25.0.0-dev.4.tar.gz"
  version "25.0.0-dev.4"
  sha256 "0da9115b08a291d0622e227813e1008a06164c24e256567d9cfb64729e98c78f"
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

  on_macos do
    on_arm do
      resource "asimov-dataset" do
        url "https://github.com/asimov-platform/asimov-dataset-cli/releases/download/25.0.0-dev.6/asimov-dataset-cli-macos-arm.gz"
        sha256 "d2f99004bf815f339f2e27f3f6b4f85f682ce48a4ca0cdb8a5614a07a0afd549"
      end
      resource "asimov-module" do
        url "https://github.com/asimov-platform/asimov-module-cli/releases/download/25.0.0-dev.3/asimov-module-cli-macos-arm.gz"
        sha256 "33d613fb703ca893cecb4b47dd4b8ff627dafd5b7968ff81545a1af57db7aa96"
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
        url "https://github.com/asimov-platform/asimov-module-cli/releases/download/25.0.0-dev.3/asimov-module-cli-macos-x86.gz"
        sha256 "d87085a6c955e0de0190988e365905148013d0257cb745908a70adb1ee619b3a"
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
        url "https://github.com/asimov-platform/asimov-module-cli/releases/download/25.0.0-dev.3/asimov-module-cli-linux-x86-gnu.gz"
        sha256 "dc0c2951287df99aa20d50e2525395c62de1c2cbc716c075b9fff5003cbaa4d3"
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
