# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/SAP/astonish"
  version "3.3.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.3.1/astonish-darwin-amd64"
      sha256 "32bbe3ec65ca75a34049072676eaf9e1658bda4fddc966b5405490076e987e2e"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.3.1/astonish-darwin-arm64"
      sha256 "92183b73ad3d1712f9e580b7fb868cfb0a1d6492ea2e0f63f8dd9951cf9bdd6e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.3.1/astonish-linux-amd64"
      sha256 "b85fed44410fbc678da3be86de884c77c0f54c5b5d08d174e5046d257e9136c7"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.3.1/astonish-linux-arm64"
      sha256 "a1f8f85365a11173cd1e29cab1a960d1002dfd6f0c327407b91e98d198109a5b"
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
