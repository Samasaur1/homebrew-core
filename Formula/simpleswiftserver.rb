class Simpleswiftserver < Formula
  desc "A Swift executable equivalent to Python's SimpleHTTPServer"
  homepage "https://github.com/Samasaur1/SimpleSwiftServer"
  url "https://github.com/Samasaur1/SimpleSwiftServer/archive/v2.0.0.tar.gz"
  sha256 "b1c75b9a12b1ed8f7ad58bf6e9fabf8ab20d724543746b77bdc6ad9a5f0db909"
  version "1.2.1"
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
