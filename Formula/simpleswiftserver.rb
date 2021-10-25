class Simpleswiftserver < Formula
  desc "A Swift executable equivalent to Python's SimpleHTTPServer — plus more!"
  homepage "https://samasaur1.github.io/projects/simpleswiftserver.html"
  url "https://github.com/Samasaur1/SimpleSwiftServer/archive/v4.3.1.tar.gz"
  sha256 "f06e0f427ace127b08993060c693b977758fd18f59e4f719a84a227e3e09edc4"
  version "4.3.1"
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

  bottle do
    root_url "https://github.com/Samasaur1/SimpleSwiftServer/releases/download/v4.3.0"
    cellar :any_skip_relocation
    sha256 "89076d75263eddd39f057088dcadca93b851dc935c9747d038e53e4b08d4b1d9" => :big_sur
  end
end
