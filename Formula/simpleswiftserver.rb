class Simpleswiftserver < Formula
  desc "A Swift executable equivalent to Python's SimpleHTTPServer"
  homepage "https://github.com/Samasaur1/SimpleSwiftServer"
  url "https://github.com/Samasaur1/SimpleSwiftServer/archive/v1.2.1.tar.gz"
  sha256 "9b3e127f34bcdf64afd4e3ccc0f290fcd4c57e1fda10a9c5973774698d41a360"
  version "1.2.1"
  head "https://github.com/Samasaur1/SimpleSwiftServer.git"

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
