# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "An autonomous AI agent that learns your workflows"
  homepage "https://github.com/SAP/astonish"
  version "3.1.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.1.2/astonish-darwin-amd64"
      sha256 "ec90cb0bb49b99800bd7e3f70b1a6043fce77c02454885765a97235ee8027bc6"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.1.2/astonish-darwin-arm64"
      sha256 "8095b62eb9f1e3f1a239fa45e69bb4bee2d0729af9a695cad3a111eb9ac410ce"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.1.2/astonish-linux-amd64"
      sha256 "525d31e410d50940de09f83d7ca3878d7562077ef5dd9ad4584bd7f0395d2516"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.1.2/astonish-linux-arm64"
      sha256 "50dd7a253f5ddce5f26dbe58e1dfaca2fba1faa8afaf53d4627dddf43ccec8f1"
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
