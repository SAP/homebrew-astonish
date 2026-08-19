# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/SAP/astonish"
  version "3.5.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.5.0/astonish-darwin-amd64"
      sha256 "a253e88360a8124f82811ba25f66c349d06986a5d4011d85641a02331845317a"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.5.0/astonish-darwin-arm64"
      sha256 "936af33b34c01697cbb4e5f3b2c05eebe065cb1b109dcd561ed57ae1ff0c5165"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.5.0/astonish-linux-amd64"
      sha256 "4f1595c78dc05094de92b6197a33e0887768dbabc2391b3066b471e8d50cc826"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.5.0/astonish-linux-arm64"
      sha256 "7a3df24a647bba71a8bfca83eb9b2ac51ec0ba2dd3d31671713698c9f9adb8c9"
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
