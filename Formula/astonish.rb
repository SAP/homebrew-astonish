# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/SAP/astonish"
  version "3.1.7"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.1.7/astonish-darwin-amd64"
      sha256 "69d57fabb70f11e5b33a1aa1ab379adf1aeabf1a77916c63831b60c7a3544c5d"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.1.7/astonish-darwin-arm64"
      sha256 "b15bc4c5402dcd889145851fa12e2ef75e5817d00b78825f798ce0566aa1b68f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.1.7/astonish-linux-amd64"
      sha256 "50365a1314b0a5fb2a449a9687d541c6aa575af460fd3ba266013d7b62befbcf"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.1.7/astonish-linux-arm64"
      sha256 "01f1da73ebbc08100ef350141a83206b4f5a89fe81de3e678a7afa792eb2988d"
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
