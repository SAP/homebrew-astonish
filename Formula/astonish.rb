# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/SAP/astonish"
  version "3.8.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.8.0/astonish-darwin-amd64"
      sha256 "e2b5e9fe76a4a3976f31a0baaa47587837fe080aeca9394ca5a0e5452a0e4577"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.8.0/astonish-darwin-arm64"
      sha256 "b450e88d64f556b38bd8bbfcd7ffd230941e6a0ae131ea98c338fd50c29df929"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.8.0/astonish-linux-amd64"
      sha256 "1f1373eaabf5dcb1a23d361b7e233e5cb0bcd486fa14e1111f2244457daab17d"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.8.0/astonish-linux-arm64"
      sha256 "83c8d58c1433c9c814460882362ab093537d5d2b35d8395b0f11fdc1a1d4bebb"
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
