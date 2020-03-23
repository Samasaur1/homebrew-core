class RpgCardGenerator < Formula
  desc "A card generator to interface with https://crobi.github.io/rpg-cards/generator/generate.html"
  homepage "https://github.com/Samasaur1/RPG-card-generator"
  url "https://github.com/Samasaur1/RPG-card-generator/archive/v0.6.0.tar.gz"
  sha256 "ab5a37889e04ee6b51000232337fb2062223af0d02650de292ab1bd2af168ed0"
  version "0.6.0"
  head "https://github.com/Samasaur1/RPG-card-generator.git"

  depends_on :xcode

  def install
    # fixes an issue an issue in homebrew when both Xcode 9.3+ and command line tools are installed
    # see more details here https://github.com/Homebrew/brew/pull/4147
    ENV["CC"] = Utils.popen_read("xcrun -find clang").chomp

    build_path = "#{buildpath}/.build/release/cardgen"
    ohai "Building Cardgen"
    system("swift build --disable-sandbox -c release")
    mv "#{buildpath}/.build/release/RPGCardGenerator", "#{buildpath}/.build/release/cardgen"
    bin.install build_path
    ohai "Successfully installed Cardgen"
  end

  def caveats
    <<~EOS
      Run 'cardgen RPGSTDLIB' to load the standard library
    EOS
  end
end
