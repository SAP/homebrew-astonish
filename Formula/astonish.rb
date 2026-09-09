# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/SAP/astonish"
  version "3.7.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.7.2/astonish-darwin-amd64"
      sha256 "0fca8156679627c04df38712a2ccd26dc1b3cf47036d376ce3d6e817bbf5b429"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.7.2/astonish-darwin-arm64"
      sha256 "3511500056a2cfe2add97006e902f495c74e2f11fc7516da8c660ed8b299b572"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.7.2/astonish-linux-amd64"
      sha256 "d961716f187948443e0f12c7a885fe985dc4553eb244221c25c699cc2a11b0e0"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.7.2/astonish-linux-arm64"
      sha256 "771ddf0221854238b8d11d767ad5bdb7c47d5387b09ee837a6086934216542e1"
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
