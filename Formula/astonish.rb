# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/SAP/astonish"
  version "3.8.4"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.8.4/astonish-darwin-amd64"
      sha256 "c6029e449841c95bcb38d8aaee7cea0cdf3710abfc1ab9e725472afff043767e"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.8.4/astonish-darwin-arm64"
      sha256 "0cf4a42765c1a17b07e90612b97de8954081ae1c41bc4d9d0b65f05b9705e0e1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.8.4/astonish-linux-amd64"
      sha256 "523a9156de3830d9be575033fca570347234fbcc0963a00d9bde10d67ac5251e"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.8.4/astonish-linux-arm64"
      sha256 "3cb62362dd1a500df95452052228374b7bfdc7d99a4488e6f30410b959bfe982"
    end
  end

  def install
    binary_name = "astonish"
    downloaded_file = Dir["astonish-*"].first || "astonish"
    
    if File.exist?(downloaded_file)
      bin.install downloaded_file => binary_name
    else
      bin.install binary_name
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/astonish --version", 2)
  end
end
