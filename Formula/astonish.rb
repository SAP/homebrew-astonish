# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/SAP/astonish"
  version "3.5.3"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.5.3/astonish-darwin-amd64"
      sha256 "5040ec170d657367ada398f1ba85c44e8752d9d533c78a841c3dcf773ffde4a4"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.5.3/astonish-darwin-arm64"
      sha256 "8b5cc394b294300cf54682d5e8396f8ce54f44dfebf685c917eba59168662dff"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.5.3/astonish-linux-amd64"
      sha256 "4451a12034441e084af4f8d804bc1e6dc25b03ba35fc8382d8f8d2cc71cccf71"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.5.3/astonish-linux-arm64"
      sha256 "e518000708bbfcc34817a2305a1aef32a869002d635ec123be1a2c8ccca74783"
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
