class RpgCardGenerator < Formula
  desc "A card generator to interface with https://crobi.github.io/rpg-cards/generator/generate.html"
  homepage "https://github.com/Samasaur1/RPG-card-generator"
  url "https://github.com/Samasaur1/RPG-card-generator/archive/v0.5.0.tar.gz"
  sha256 "2b288022f0fe91a329088311792855a4ba151e3e991a1b02af26f41c2753d51d"
  version "0.5.0"
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
