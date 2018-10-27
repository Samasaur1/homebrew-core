class Simpleswiftserver < Formula
  desc "A Swift executable equivalent to Python's SimpleHTTPServer"
  homepage "https://github.com/Samasaur1/SimpleSwiftServer"
  url "https://github.com/Samasaur1/SimpleSwiftServer/archive/v1.1.0.tar.gz"
  sha256 "c82bc4339da692a14016289799bd6dc33ae53449586f6a987455fee5fff2e7cf"
  version "1.1.0"
  head "https://github.com/Samasaur1/SimpleSwiftServer.git"

  depends_on :xcode

  def install
    # fixes an issue an issue in homebrew when both Xcode 9.3+ and command line tools are installed
    # see more details here https://github.com/Homebrew/brew/pull/4147
    ENV["CC"] = Utils.popen_read("xcrun -find clang").chomp

    build_path = "#{buildpath}/.build/release/server"
    ohai "Building Typer"
    system("swift build --disable-sandbox -c release -Xswiftc -static-stdlib")
    bin.install build_path
  end
end
