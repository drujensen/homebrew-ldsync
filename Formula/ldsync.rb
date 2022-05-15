class Ldsync < Formula
  desc "ldsync utility will manage your Launch Darkly flags"
  homepage "https://github.com/drujensen/ldsync"
  url "https://github.com/drujensen/ldsync/archive/refs/tags/v0.1.7.tar.gz"
  sha256 "8454dd15bec0ca80efed87e43aab5eff4ef57cae0e312a8ebdc73bd13e08718d"

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
