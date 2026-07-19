# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/SAP/astonish"
  version "3.1.6"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.1.6/astonish-darwin-amd64"
      sha256 "cc7344544fe4f7c0b808977036970c75f02799de14b6e1473bed614deb5e1a48"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.1.6/astonish-darwin-arm64"
      sha256 "2c9d737b3e5e51b098a0e516593697917420bf499ada27c90d4f7e912d0c7591"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.1.6/astonish-linux-amd64"
      sha256 "5397fca0859983186601702d8c404d55cbd44c8aba638a08d8e3b320915b61b0"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.1.6/astonish-linux-arm64"
      sha256 "b75380539737c8711c5a4366684d2b38b84845489fb7f0d87ecdf7c4878d62f7"
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
