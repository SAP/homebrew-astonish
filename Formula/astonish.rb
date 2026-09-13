# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/SAP/astonish"
  version "3.8.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.8.2/astonish-darwin-amd64"
      sha256 "74f544f0ccedcad0c313e6799eb03d5ac33935f7b00c5929f9a9bf8476265572"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.8.2/astonish-darwin-arm64"
      sha256 "5d0c709a25276280861382d57cf148f75f83c92afa8fc9a7b8c1846883dd4631"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/SAP/astonish/releases/download/v3.8.2/astonish-linux-amd64"
      sha256 "d161d972557e09ce076785e1192fafb815b7fb6301a39bf0d82f27c4d75533d6"
    end

    on_arm do
      url "https://github.com/SAP/astonish/releases/download/v3.8.2/astonish-linux-arm64"
      sha256 "36e0e2e7fd3ee57d65bff0f13f765310e3ba32dbb8fda2f694fa83a06a76585d"
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
