# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/SAP/astonish"
  version "3.8.5"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.8.5/astonish-darwin-amd64"
      sha256 "b9c2fbc7dedbb9f74eb4f2a25d4fb926e4e625166cbf0b0fd3f50fe3ed4ebc0a"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.8.5/astonish-darwin-arm64"
      sha256 "1918c93d7d8f2621c3da93f3ea6d73bc66331de039b5fed386f24dfa0543ae28"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.8.5/astonish-linux-amd64"
      sha256 "7b40f439b6c76cf06aec95556905c2b08b1baa441b04b194b46f6c99823f5dad"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.8.5/astonish-linux-arm64"
      sha256 "9637e59d7e40d01c820d1a622ae83f5142010c958189feb52798a7e52fa90a14"
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
