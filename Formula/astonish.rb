# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/SAP/astonish"
  version "3.7.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.7.0/astonish-darwin-amd64"
      sha256 "8768974e595619aeba7e3a3368eb9775b226605a44de1bcb4cddb8b407889c0f"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.7.0/astonish-darwin-arm64"
      sha256 "83da7e13a8a0592a8f408da10b990922bfd56b22339637d6b89bebb696dd557f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.7.0/astonish-linux-amd64"
      sha256 "55e951d1650471fa539d201aa1e198840cc6921c9ccd1f9590b88ceb397bd8b9"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.7.0/astonish-linux-arm64"
      sha256 "b3620d7a98692bf808dc27c8de296ba3b63fb35c55d0de6224a30cdd5aace05d"
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
