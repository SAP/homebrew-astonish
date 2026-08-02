# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/SAP/astonish"
  version "3.3.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.3.0/astonish-darwin-amd64"
      sha256 "553ab8621cc2b6ad32280cafe2cb6a264f55528bc075afaf5f6d511e38c9a16a"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.3.0/astonish-darwin-arm64"
      sha256 "4d7d0a992055f546998095033c70a049356d77faf588cce26c54175b5190cc42"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.3.0/astonish-linux-amd64"
      sha256 "9abf53957199dfeff60e3a3f26e677c01c0ab4ba12edd5f24926de53110bdff3"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.3.0/astonish-linux-arm64"
      sha256 "2180783e8c663ada1916065b534d56a64a1336c84937dffa475293b659d3e52f"
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
