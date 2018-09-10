class RpgCardGenerator < Formula
  desc "A card generator to interface with https://crobi.github.io/rpg-cards/generator/generate.html"
  homepage "https://github.com/Samasaur1/RPG-card-generator"
  url "https://github.com/Samasaur1/RPG-card-generator/releases/download/v0.4.0/cardgen-0.4.0.tar.gz"
  sha256 "47a64b60e012fdb377424fc7038bb234f21a8a273548b92c291dd3ea23744199"
  version "0.4.0"
  revision 8

  bottle :unneeded
  
  def install
    bin.install "cardgen"
    system "#{bin}/cardgen", "RPGSTDLIB"
  end
  
  def caveats
    <<~EOS
      Run 'cardgen RPGSTDLIB' to load the standard library
    EOS
  end
end
