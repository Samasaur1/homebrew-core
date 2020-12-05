class Simpleswiftserver < Formula
  desc "A Swift executable equivalent to Python's SimpleHTTPServer — plus more!"
  homepage "https://samasaur1.github.io/projects/simpleswiftserver.html"
  url "https://github.com/Samasaur1/SimpleSwiftServer/archive/v4.2.0.tar.gz"
  sha256 "bf9aa3f83a38d9140e6b29a9a228775f635bb29e841f23735ff18fae23b8776a"
  version "4.2.0"
  head "https://github.com/Samasaur1/SimpleSwiftServer.git"
  revision 1

  depends_on :xcode

  def install
    # fixes an issue an issue in homebrew when both Xcode 9.3+ and command line tools are installed
    # see more details here https://github.com/Homebrew/brew/pull/4147
    ENV["CC"] = Utils.popen_read("xcrun -find clang").chomp

    build_path = "#{buildpath}/.build/release/server"
    ohai "Building SimpleSwiftServer"
    system("swift build --disable-sandbox -c release")
    bin.install build_path
  end
end
