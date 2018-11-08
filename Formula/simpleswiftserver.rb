class Simpleswiftserver < Formula
  desc "A Swift executable equivalent to Python's SimpleHTTPServer"
  homepage "https://github.com/Samasaur1/SimpleSwiftServer"
  url "https://github.com/Samasaur1/SimpleSwiftServer/archive/v1.2.0.tar.gz"
  sha256 "86e572f0774132f2eca2b8bd04ce4c619654ad75590460c436c98f75212f7ca6"
  version "1.2.0"
  head "https://github.com/Samasaur1/SimpleSwiftServer.git"
  revision 1

  depends_on :xcode

  def install
    # fixes an issue an issue in homebrew when both Xcode 9.3+ and command line tools are installed
    # see more details here https://github.com/Homebrew/brew/pull/4147
    ENV["CC"] = Utils.popen_read("xcrun -find clang").chomp

    build_path = "#{buildpath}/.build/release/server"
    ohai "Building SimpleSwiftServer"
    system("swift build --disable-sandbox -c release -Xswiftc -static-stdlib")
    bin.install build_path
  end
end
