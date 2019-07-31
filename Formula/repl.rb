class Repl < Formula
  desc "A simple CLT to prefix any command with a given one"
  homepage "https://github.com/Samasaur1/REPL"
  url "https://github.com/Samasaur1/REPL/archive/v1.0.0.tar.gz"
  sha256 "63b67bd0a4f5f2636b1e937b85a133309a82df4560de3cd5d55b17fdd5305774"
  version "1.0.0"
  head "https://github.com/Samasaur1/REPL.git"

  depends_on :xcode

  def install
    args = ["swift", "build",
      "--configuration", "release",
      "--disable-sandbox"]
    args += ["-Xswiftc", "-static-stdlib"] unless swift_abi_safe or OS.linux?

    system *args

    bin.install '.build/release/REPL'
  end

  def swift_abi_safe
    # Swift 5 is ABI safe since Xcode 10.2-beta3
    return false unless OS.mac?
    return false unless MacOS.full_version >= '10.14.4'
    # this check is redundant really, but we’re just being careful
    return false unless File.file? "/usr/lib/swift/libswiftFoundation.dylib"
    `swift --version` =~ /Swift version (\d+)\.\d+/
    $1.to_i >= 5
  end
end
