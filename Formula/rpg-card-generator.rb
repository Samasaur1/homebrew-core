class RpgCardGenerator < Formula
  desc "A card generator to interface with https://crobi.github.io/rpg-cards/generator/generate.html"
  homepage "https://github.com/Samasaur1/RPG-card-generator"
  url "https://github.com/Samasaur1/RPG-card-generator/archive/v0.4.1.tar.gz"
  sha256 "0c9606a3e6a2a5a17bc97e8fb0e9332cebfaa01fa2182d2a5186f0a04a59639b"
  version "0.4.1"
  revision 7

  depends_on :xcode

  def install
    # fixes an issue an issue in homebrew when both Xcode 9.3+ and command line tools are installed
    # see more details here https://github.com/Homebrew/brew/pull/4147
    ENV["CC"] = Utils.popen_read("xcrun -find clang").chomp

    build_path = "#{buildpath}/.build/release/cardgen"
    ohai "Building Cardgen"
    system("swift build --disable-sandbox -c release -Xswiftc -static-stdlib")
    mv "#{buildpath}/.build/release/RPGCardGenerator", "#{buildpath}/.build/release/cardgen"
    system("#{buildpath} RPGSTDLIB")
    bin.install build_path
    ohai "Successfully installed Cardgen"
  end

  def caveats
    <<~EOS
      Run 'cardgen RPGSTDLIB' to load the standard library
    EOS
  end
end
