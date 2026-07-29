# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/SAP/astonish"
  version "3.2.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.2.0/astonish-darwin-amd64"
      sha256 "955dda6fb2decaf30d12c57b84e4ee06daa9067c1c351a56a8c63c84b4dcdc82"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.2.0/astonish-darwin-arm64"
      sha256 "81e0508f0b71012cf47b0f43d0c316da9531aa7047285a5a984b26ea6b459b01"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.2.0/astonish-linux-amd64"
      sha256 "bc102a85fb53a74900b3646780d2971f8e4439978de2a54cc923e9f956cfffdc"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.2.0/astonish-linux-arm64"
      sha256 "394b76bb42ef199f51d423d690f364e0ddaa52a78e1846c8c65584ed2c38e57b"
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
