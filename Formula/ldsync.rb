class Ldsync < Formula
  desc "ldsync utility will manage your Launch Darkly flags"
  homepage "https://github.com/drujensen/ldsync"
  url "https://github.com/drujensen/ldsync/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "c11e3fbcd8438e20d96368c5b60f93be639982c339e3db32015dfb92f6e91503"

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
