class Repl < Formula
  desc "A simple CLT to prefix any command with a given one"
  homepage "https://github.com/Samasaur1/REPL"
  url "https://github.com/Samasaur1/REPL/archive/v1.1.0.tar.gz"
  sha256 "0a1215b652f5afee3429d617018f066910408e4f7c6a829b28c61b49d3063faf"
  version "1.1.0"
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
