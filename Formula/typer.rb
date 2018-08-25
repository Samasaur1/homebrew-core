class Typer < Formula
  desc "An automatic typer for any text you give it"
  homepage "https://github.com/Samasaur1/TyperTool"
  url "https://github.com/Samasaur1/TyperTool/releases/download/v1.0.0/typer-1.0.0.tar.gz"
  sha256 "ef51c8bec87929fdad367c93b6c6c7208a1b08808d91992e8d6f9ff03f04b1cb"
  version "1.0.0"

  bottle :unneeded
  
  def install
    bin.install "typer"
  end
end
