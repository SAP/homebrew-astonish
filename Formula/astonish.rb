# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/SAP/astonish"
  version "3.8.6"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.8.6/astonish-darwin-amd64"
      sha256 "6575cddef90654848f977026184139d659d91dd99d4f3282227adb62a729cb36"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.8.6/astonish-darwin-arm64"
      sha256 "64e1395d15f85e2c427e5892d2d194fb1cdc0a667b467e7529203e1a47bff330"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.8.6/astonish-linux-amd64"
      sha256 "92ec09e7f058e8a9313a17845d27f44f80df616040de3afc51156f0d435b66cf"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.8.6/astonish-linux-arm64"
      sha256 "9c596a37c82b54534f626d61104fd67f21b37f9c5f2a1e302e0bac21a7234f68"
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
