# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/SAP/astonish"
  version "3.5.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.5.2/astonish-darwin-amd64"
      sha256 "57239e7d750bf27231494a561c4e99f90546919fa26655b0f2f56eafe2396706"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.5.2/astonish-darwin-arm64"
      sha256 "e3afbf1e0d00af20da58aa6945e08726bfd37343d75ec7b98a0ef73f5777dd9c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.5.2/astonish-linux-amd64"
      sha256 "4c4d6d6e0b5ddd2357c10e0f4198a1a865d75131d60c1aeba5ee9cd57cb5a63d"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.5.2/astonish-linux-arm64"
      sha256 "a478cd2a46ad3ff3dafbe7f606363fa924d02b697d1dafd92d3bb80dc1923884"
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
