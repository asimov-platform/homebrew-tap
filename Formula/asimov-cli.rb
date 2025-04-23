class AsimovCli < Formula
  desc "ASIMOV Command-Line Interface (CLI)"
  homepage "https://github.com/asimov-platform/asimov-cli"
  url "https://github.com/asimov-platform/asimov-cli/archive/refs/tags/25.0.0-dev.4.tar.gz"
  sha256 "0da9115b08a291d0622e227813e1008a06164c24e256567d9cfb64729e98c78f"
  version "25.0.0-dev.4"
  license "Unlicense"
  head "https://github.com/asimov-platform/asimov-cli.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://ghcr.io/v2/asimov-platform/new"
    rebuild 2
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "6c385e2f0856fbf8b00cd37691570825e6cb2e7bdea4b1308b70715b54a897e7"
    sha256 cellar: :any_skip_relocation, ventura:       "83d3935674331e627f34b95cdffec8f7bea2dd5a8b429e090cc31cef76b4fb70"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "e26a5c99741e68584c7df398b5e21d06cc718c39d97eec0b28f2a79672c12139"
  end

  depends_on "rust" => :build

  on_macos do
    on_arm do
      resource "asimov-dataset" do
        url "https://github.com/asimov-platform/asimov-dataset-cli/releases/download/25.0.0-dev.5/asimov-macos-arm.gz"
        sha256 "cf4f4b1058db1f5238df985b3958e596c6eea84c3f92f0d8f0f5a489174eefbf"
      end
      resource "asimov-module" do
        url "https://github.com/asimov-platform/asimov-module-cli/releases/download/25.0.0-dev.2/module-cli-macos-arm.gz"
        sha256 "39d3c86b017c0b51a263f946f44d398161f44920e3b224e8c718cca3f7cbd57d"
      end
      # resource "asimov-repository" do
      #   url "https://github.com/asimov-platform/asimov-repository-cli/releases/download/25.0.0-dev.1/asimov-macos-arm.gz"
      #   sha256 "64941269d9bcd8a19c2b00877da71e252ddf9f05a7ccdcfc3fa79eb02b9b4ce0"
      # end
    end

    on_intel do
      resource "asimov-dataset" do
        url "https://github.com/asimov-platform/asimov-dataset-cli/releases/download/25.0.0-dev.5/asimov-macos-x86.gz"
        sha256 "ea11d213dc01c99171e456de94958acc37abe84992b1c234b48e75a85ad6497d"
      end
      resource "asimov-module" do
        url "https://github.com/asimov-platform/asimov-module-cli/releases/download/25.0.0-dev.2/module-cli-macos-x86.gz"
        sha256 "18b26b321279923109b5dc81d7c8cb3cb5db7179a5db6e27601849add9195c37"
      end
      # resource "asimov-repository" do
      #   url "https://github.com/asimov-platform/asimov-repository-cli/releases/download/25.0.0-dev.1/asimov-macos-x86.gz"
      #   sha256 "501c312b5bfce96bba454591e3fcae3735d2dcc743bfdfbd11896fc517c97f21"
      # end
    end
  end

  on_linux do
    on_intel do
      resource "asimov-dataset" do
        url "https://github.com/asimov-platform/asimov-dataset-cli/releases/download/25.0.0-dev.5/asimov-linux-x86-gnu.gz"
        sha256 "abbcf6612278381d079e85b658cced97b47f71652437fa39e6eb8dc2423d6d6d"
      end
      resource "asimov-module" do
        url "https://github.com/asimov-platform/asimov-module-cli/releases/download/25.0.0-dev.2/module-cli-linux-x86-gnu.gz"
        sha256 "d8cb3ad98499d42ec4f89c6669264935a41b0583f6e3995b7e1382b73b654af6"
      end
      # resource "asimov-repository" do
      #   url "https://github.com/asimov-platform/asimov-repository-cli/releases/download/25.0.0-dev.1/asimov-linux-x86-gnu.gz"
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
