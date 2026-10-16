# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/SAP/astonish"
  version "3.9.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.9.1/astonish-darwin-amd64"
      sha256 "06bcc4a10d4174363f6b4fe25308b9bf87ab4db3da42ec5029a245d455c92af4"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.9.1/astonish-darwin-arm64"
      sha256 "6096c390a9ff2dbd0ef6ddbad03a74a440d6c553a20e539ca54767594a09e7ad"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.9.1/astonish-linux-amd64"
      sha256 "9f8fd0cdf25673fc9a23fa143bacee824a6431d1414bd5c61f3d8d968fbd4641"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.9.1/astonish-linux-arm64"
      sha256 "802e6fe5ee187096f3a2e3fb6eb2a0ead78dae8311122c25b345a85ff66f82aa"
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
