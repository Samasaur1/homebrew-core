class SimpleswiftserverAT2 < Formula
  desc "A Swift executable equivalent to Python's SimpleHTTPServer"
  homepage "https://github.com/Samasaur1/SimpleSwiftServer/tree/legacy-2.x"
  url "https://github.com/Samasaur1/SimpleSwiftServer/archive/v2.0.4.tar.gz"
  sha256 "3fcc3ccbabcb1478512b765be14e283ab7e6518597a40e06d844b52e0b7fb4f7"
  version "2.0.4"
  head "https://github.com/Samasaur1/SimpleSwiftServer.git"

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
