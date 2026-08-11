# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/SAP/astonish"
  version "3.4.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.4.1/astonish-darwin-amd64"
      sha256 "cc507e07b898dc32fbf8d500a8a5ea83b2e653c2ec575ec6690ba469f28d8ce7"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.4.1/astonish-darwin-arm64"
      sha256 "4d26e50cc271e0421e6e3646b4063680151e9ec540f0c10f6b80b288ad1debe2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.4.1/astonish-linux-amd64"
      sha256 "6521329e6fb3668dc7ae954a61557cb58ea05f2926538157b66cef0c0a822dfd"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.4.1/astonish-linux-arm64"
      sha256 "c1205c5bd3de4763641b1ba32a295fe890d44badedf669d8d594d33b288e191c"
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
