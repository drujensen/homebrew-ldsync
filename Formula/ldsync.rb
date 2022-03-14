class Ldsync < Formula
  desc "ldsync utility will manage your Launch Darkly flags"
  homepage "https://github.com/drujensen/ldsync"
  url "https://github.com/drujensen/ldsync/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "41e0728f843b6dfa2e74fbc210d918b8b005f8a0abb645f305d87b01c26853f3"

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
