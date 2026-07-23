# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/SAP/astonish"
  version "3.1.10"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.1.10/astonish-darwin-amd64"
      sha256 "9c65da967a786b103fbb7da04417c62cb5c836ce5dbe95c6d3ff914af21d7796"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.1.10/astonish-darwin-arm64"
      sha256 "56b66d7ac67206b224362476e5b1c7d89e0629d6cee43d8fd1d2fbbe85de8066"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.1.10/astonish-linux-amd64"
      sha256 "3c5911df892b54e998455cbf5d28b89d47109a47db683f2c9013e63a864b8732"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.1.10/astonish-linux-arm64"
      sha256 "ff27bce164a5d9e7af3072f9fa09f2f43481fbb6b3ef334657de65ed21ca920e"
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
