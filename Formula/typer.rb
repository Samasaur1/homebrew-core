class Typer < Formula
  desc "An automatic typer for any text you give it"
  homepage "https://github.com/Samasaur1/TyperTool"
  url "https://github.com/Samasaur1/TyperTool/archive/v1.0.0.tar.gz"
  sha256 "95b3f196446e9236a5aa305c69dfe09230b5cc2cba8290b72323b0f4549dd412"
  version "1.0.0"
  head "https://github.com/Samasaur1/TyperTool.git"
  revision 1

  depends_on :xcode
  
  def install
    # fixes an issue an issue in homebrew when both Xcode 9.3+ and command line tools are installed
    # see more details here https://github.com/Homebrew/brew/pull/4147
    ENV["CC"] = Utils.popen_read("xcrun -find clang").chomp

    build_path = "#{buildpath}/.build/release/typer"
    ohai "Building Typer"
    system("swift build --disable-sandbox -c release -Xswiftc -static-stdlib")
    bin.install build_path
  end
end
