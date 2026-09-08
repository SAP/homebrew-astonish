# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/SAP/astonish"
  version "3.7.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.7.1/astonish-darwin-amd64"
      sha256 "62c350b3b8b09dd6dc5720f89bb677e19108b95223f67ef202cb5c867d54d0cc"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.7.1/astonish-darwin-arm64"
      sha256 "55acbf8f3c0f92b4eab1fd7f599b038969a42e7d1e1fad8bf8fada86c056f127"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.7.1/astonish-linux-amd64"
      sha256 "e28d2aa9f11d6100c9dcc721af7f52ebb04e45a93d367214ed48ec7a5e5fb808"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.7.1/astonish-linux-arm64"
      sha256 "ad6065bc2c5ca6e9831af8d8cc8d82333565f9fc8b40d100b26b50563988449d"
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
