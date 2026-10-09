# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/SAP/astonish"
  version "3.9.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.9.0/astonish-darwin-amd64"
      sha256 "d4117b0686b446c92e8916d0333ce90ccafb324392c1e0a6f808928de246e41e"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.9.0/astonish-darwin-arm64"
      sha256 "b149badec4660d8e4e817b5613525cacf786ee8aebe3aa109c8c81000f9f6147"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.9.0/astonish-linux-amd64"
      sha256 "451db55d624332fc686c9a166010def5040b3cf5f3839744715d0ccfed23118e"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.9.0/astonish-linux-arm64"
      sha256 "6d2f0272a4ae9ff92caf2eb4de22edd6485d208d06602c6fb14ca74b895679d0"
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
