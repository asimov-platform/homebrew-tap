class AsimovCli < Formula
  desc "ASIMOV Command-Line Interface (CLI)"
  homepage "https://github.com/asimov-platform/asimov-cli"
  url "https://github.com/asimov-platform/asimov-cli/archive/refs/tags/25.0.0-dev.7.tar.gz"
  version "25.0.0-dev.7"
  sha256 "b302fb69ab96339257ce05b88deafd29bbb20a1457d1d6bae89c6a1e522a241d"
  license "Unlicense"
  head "https://github.com/asimov-platform/asimov-cli.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://ghcr.io/v2/asimov-platform/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "6d9c39f78143f5b3f2ba5150da6dea924b4183f3ca7250958ee837970ae1c897"
    sha256 cellar: :any_skip_relocation, ventura:       "560491cc3bc1d80548c605433ed058a8880bd8231f15ec26e90950fd414996ec"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "db94bb7ee6d9d046b3fafcb9dd2eff6d0d67a97f8143a20367f9f766e33448e2"
  end

  depends_on "rust" => :build

  on_macos do
    on_arm do
      resource "asimov-dataset" do
        url "https://github.com/asimov-platform/asimov-dataset-cli/releases/download/25.0.0-dev.6/asimov-dataset-cli-macos-arm.gz"
        sha256 "d2f99004bf815f339f2e27f3f6b4f85f682ce48a4ca0cdb8a5614a07a0afd549"
      end
      resource "asimov-module" do
        url "https://github.com/asimov-platform/asimov-module-cli/releases/download/25.0.0-dev.5/asimov-module-cli-macos-arm.gz"
        sha256 "1abb2fb25275c9bbe10e601305ccb156378816683899cee8199bc6473c215a37"
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
        url "https://github.com/asimov-platform/asimov-module-cli/releases/download/25.0.0-dev.5/asimov-module-cli-macos-x86.gz"
        sha256 "69f399551c99860927f6a3f88b45a21aa9248d24a0ef6944fdcda2deec324d7c"
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
        url "https://github.com/asimov-platform/asimov-module-cli/releases/download/25.0.0-dev.5/asimov-module-cli-linux-x86-gnu.gz"
        sha256 "70c45fb854967a47342ab52a18dd4158ec2debe156d60691151a24914cf05ba6"
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
