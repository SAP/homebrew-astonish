# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/SAP/astonish"
  version "3.4.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.4.0/astonish-darwin-amd64"
      sha256 "74484c73b1c332b8ca290817828ff9014b60887f81192a1cab25b64cfbbc1745"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.4.0/astonish-darwin-arm64"
      sha256 "cc08698a3d69ba89eb3206fc5100b752259772f59d94b04f4e8fb6a1bcc55e0c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.4.0/astonish-linux-amd64"
      sha256 "e789fa27af5d68da038cbd4f790a0d46366faeb76894f9ff955de796e0b80644"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.4.0/astonish-linux-arm64"
      sha256 "5f78962789306d6a98d706fd0d436836b554547d5e7f38aba1f99bc947d2e00c"
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
