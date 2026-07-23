# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/SAP/astonish"
  version "3.1.9"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.1.9/astonish-darwin-amd64"
      sha256 "5c8fe834ed09a7078bc788f8fba5cd0439be935242c4354e63cf2d2bbc876911"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.1.9/astonish-darwin-arm64"
      sha256 "b80f25824a1b7d33fa6d69580be5fc3520189a80ed8bd80520aef644156e249c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.1.9/astonish-linux-amd64"
      sha256 "5a770f8c3d8aff050c626e73c302320038a5baddd56e3abc0f3b8f18c6e80cbb"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.1.9/astonish-linux-arm64"
      sha256 "c939ea048d299770bf993e9258bf06081c4ff35f2126c8495171c4a10a6241e7"
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
