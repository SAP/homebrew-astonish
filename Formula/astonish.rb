# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/SAP/astonish"
  version "3.1.4"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.1.4/astonish-darwin-amd64"
      sha256 "f0a6aa4edf23005b21f48210d218fdafabdb8ebe1daf8eec9bad40a8b213c5a8"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.1.4/astonish-darwin-arm64"
      sha256 "d4e644f72d3dba48cf297e612dbba9ba12ba43d70b0e902782f09b3fad02ef90"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.1.4/astonish-linux-amd64"
      sha256 "86db6c0822d331aaf5a7d42ed830b6c53685ad97b21a69b36666a1aa0f7c2271"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.1.4/astonish-linux-arm64"
      sha256 "5c6c862834aaccf128f4e40b398a1e4cb48e88a987b2366f70becba69a30c154"
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
