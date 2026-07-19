# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/SAP/astonish"
  version "3.1.5"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.1.5/astonish-darwin-amd64"
      sha256 "28f88f45d1e71097cbb04530aecbcaccb9f1f7d155fece04945da2ad6ffcca57"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.1.5/astonish-darwin-arm64"
      sha256 "827b96376f44c6c6c59d2dc8e14e9a8e232701c279d850bd4aae8d1e75422c7c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.1.5/astonish-linux-amd64"
      sha256 "781a46c1b57604850dd3064c8e0d80b858f06312fe2628071e217acc2b0c2da5"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.1.5/astonish-linux-arm64"
      sha256 "0b4d90be48d37b5bcd4089699151c6a8e086d44a062d12bc3054c4dcda321aa2"
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
