# TODO should be fixed
class Protoflow < Formula
  desc "Protoflow"
  homepage "https://github.com/asimov-platform/protoflow"
  license "Unlicense"
  head "https://github.com/asimov-platform/protoflow.git", branch: "master"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "lib/protoflow")
  end

  test do
    system "#{bin}/protoflow --version"
  end
end
