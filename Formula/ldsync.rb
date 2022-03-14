class Ldsync < Formula
  desc "ldsync utility will manage your Launch Darkly flags"
  homepage "https://github.com/drujensen/ldsync"
  url "https://github.com/drujensen/ldsync/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "656ce1ce67fbe605b2cb36a1d15c59aac0bac38c3fe5b261f56ee4c92e08d503"

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
