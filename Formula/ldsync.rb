class Ldsync < Formula
  desc "ldsync utility will manage your Launch Darkly flags"
  homepage "https://github.com/drujensen/ldsync"
  url "https://github.com/drujensen/ldsync/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "2d7fbf69be8c7d86a914752bd119a8f7f17046c9f7e1bd62603830e1632179e2"

  depends_on "crystal"

  def install
    system "shards", "build"
    system "mkdir", "-p", "#{prefix}/bin"
    system "cp", "bin/ldsync", "#{prefix}/bin/ldsync"
  end

  test do
    output = shell_output("#{prefix}/bin/ldsync --help")
    assert output.includes? "The Launch Darkly Sync Utility"
  end
end
