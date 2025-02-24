class Protoflow < Formula
  desc "Flow-based programming (FBP) for Rust using Protocol Buffers"
  homepage "https://github.com/imunproductive/protoflow"
  license "Unlicense"
  version "4.1.4"

  livecheck do
    url :stable
    regex(/v?(\d+(?:\.\d+)+)/i)
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/imunproductive/protoflow/releases/download/v#{version}/protoflow-macos-arm.gz"
      sha256 "32aeb2e2818d31cb287f8f8471aed7c36884e85cd0de3337cf4a2b80c33f9765"
    else
      url "https://github.com/imunproductive/protoflow/releases/download/v#{version}/protoflow-macos-x86.gz"
      sha256 "00103effc6830e45ab497f688ca5ee353ed2894f97d13d2c4db2ca4f9c9aeb67"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/imunproductive/protoflow/releases/download/v#{version}/protoflow-linux-arm.gz"
      sha256 "4d0295422c6bb859838a57783b35a0d685406066e86a7f8fbd9e4d0ad2fc6ba9"
    else
      url "https://github.com/imunproductive/protoflow/releases/download/v#{version}/protoflow-linux-x86.gz"
      sha256 "d2f9490f37c8c94bc8e4aec45395d970f7bc4c357bff807248ace9b65c18ccc2"
    end
  end

  def install
    bin.install "protoflow"
  end

  test do
    system "#{bin}/protoflow", "--version"
  end
end
