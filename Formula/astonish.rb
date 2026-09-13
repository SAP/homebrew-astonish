# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/SAP/astonish"
  version "3.8.3"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.8.3/astonish-darwin-amd64"
      sha256 "5f4363b5b8abdec022d3d1cb4b3f40b991fddcdd047ef60df3fa36804693f72a"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.8.3/astonish-darwin-arm64"
      sha256 "a2e405091733950b7f928788299a97a6f04aa1ecf320faa5c9d219a67ed9a157"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.8.3/astonish-linux-amd64"
      sha256 "56a7e57a8d91ee3a6eff0828c30a65c3528fe4361d37059fa72c0c3566d64e56"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.8.3/astonish-linux-arm64"
      sha256 "061b2fde2a2f9be2bd36044fb9499bd0b0bd8a80d86160ca3c3248599c1cad0c"
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
