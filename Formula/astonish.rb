# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/SAP/astonish"
  version "3.8.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.8.1/astonish-darwin-amd64"
      sha256 "13df7d5a3e2e1f163598f1f5858b98826a4ea6ab286a8038fd472d90430ede8c"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.8.1/astonish-darwin-arm64"
      sha256 "2723ab7ccc9fa13462d9541f9a4e985c43b6a3abc905e397f03d5c49f74d802a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.8.1/astonish-linux-amd64"
      sha256 "57d98ba9a1bbb03a0a60aa3cadcd87f9ca6bf52c1b8176d1ad6bde494e48abf7"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.8.1/astonish-linux-arm64"
      sha256 "773f0f4fb78556aece4163c44c8365075ed5337788c680c47de39a766615a234"
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
