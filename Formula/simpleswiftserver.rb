class Simpleswiftserver < Formula
  desc "A Swift executable equivalent to Python's SimpleHTTPServer"
  homepage "https://github.com/Samasaur1/SimpleSwiftServer"
  url "https://github.com/Samasaur1/SimpleSwiftServer/archive/v4.0.0.tar.gz"
  sha256 "ebe70899d32903837639363dfa62a654be9ff741d14198b78fe6cf163fb14426"
  version "4.0.0"
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
