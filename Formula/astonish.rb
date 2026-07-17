# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/SAP/astonish"
  version "3.1.3"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.1.3/astonish-darwin-amd64"
      sha256 "0ce30901eb2446b52295d131e5f3a76c36f79257d7f859b46dac4cd508c2da8d"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.1.3/astonish-darwin-arm64"
      sha256 "1d29a65174fa3a81dbcc83826502b3c565291928655296daf4d4cc79d21166da"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.1.3/astonish-linux-amd64"
      sha256 "14239c47d38c90ff8d7ca30db610a39d6674d92d5c44bf458e9fcfd1ee074e2d"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.1.3/astonish-linux-arm64"
      sha256 "eef36dbc797bbba9ec9503b27136b77cbe9033474122e7ea98424a9549bd90b5"
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
