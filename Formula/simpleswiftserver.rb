class Simpleswiftserver < Formula
  desc "A Swift executable equivalent to Python's SimpleHTTPServer — plus more!"
  homepage "https://samasaur1.github.io/projects/simpleswiftserver.html"
  url "https://github.com/Samasaur1/SimpleSwiftServer/archive/v4.3.0.tar.gz"
  sha256 "1602ebcebac5292de5fd5f5b414b45ee00aad165819d6b50153370955a8099e8"
  version "4.3.0"
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
    man1.install "server.1"
  end
end
