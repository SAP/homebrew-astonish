# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/SAP/astonish"
  version "3.5.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.5.1/astonish-darwin-amd64"
      sha256 "9673045b7bbd1ed7119bf62fedbaff4add01135c81269818711d701eba956848"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.5.1/astonish-darwin-arm64"
      sha256 "5474814e6b11a72d4f4132675c94ba7a0ea2000881ae7e93c439763cd455426e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.5.1/astonish-linux-amd64"
      sha256 "4e53a658991542c3282e038f4720591604bf2a9818da4e8d27b7400b6bc04b4a"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.5.1/astonish-linux-arm64"
      sha256 "08436aebb0503d65a3f252576ef9a508ab044aaa448fa8dc7e939403302418d5"
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
