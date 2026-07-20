# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/SAP/astonish"
  version "3.1.8"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.1.8/astonish-darwin-amd64"
      sha256 "fd7cde66be0bda463628b40204b0422c5517e03410504ed3cbac4160c8a67e1a"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.1.8/astonish-darwin-arm64"
      sha256 "e0ce9fe2ab6aa16e3c2f517c0421753ecc29da580a604ced01633af5564d96a3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.1.8/astonish-linux-amd64"
      sha256 "e98c91245c221fff135be39d8421ff0411056a82df9a595c0e33eb3a78094653"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.1.8/astonish-linux-arm64"
      sha256 "e3b2a74fccb55605996ad15d357874f126857bee90fc592589976b3f1f533dd6"
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
