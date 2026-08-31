# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/SAP/astonish"
  version "3.6.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.6.0/astonish-darwin-amd64"
      sha256 "d83e459ee1de9c302bf87e74953d4c968a9b4d78db848acc0418b25b5ab4d51b"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.6.0/astonish-darwin-arm64"
      sha256 "9538c93b9ce5e7e635cb23c7f51510e34f524052220e7bab552842b8d554f6ab"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.6.0/astonish-linux-amd64"
      sha256 "76750451f2fecd2819ce2267e0d965414052fef392fa658d3bb8c016fe7666eb"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.6.0/astonish-linux-arm64"
      sha256 "3777f2d8940e118446df00140acc879b005e7ac7fbc26809b17ec59f1337dcdf"
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
