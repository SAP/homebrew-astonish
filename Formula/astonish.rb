# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/SAP/astonish"
  version "3.3.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.3.2/astonish-darwin-amd64"
      sha256 "4c1b3303d94c5033fb349567295d4da1c15092dff7c91095d51edce6d7520415"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.3.2/astonish-darwin-arm64"
      sha256 "3d96713014236e7af203bad26ce242e4adeb6fd91bd37c5881cf6a9988c7275b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.3.2/astonish-linux-amd64"
      sha256 "b22eea78837efe8d1f589fd8f1b6b6f27850fe8b8bf1ca149fb26dcd49a264e1"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.3.2/astonish-linux-arm64"
      sha256 "6a2e9c7e16cba11eefbc15942a41f7cd04ba8b3201975f4c5a895e99ba3d09bf"
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
