class RpgCardGenerator < Formula
  desc "A card generator to interface with https://crobi.github.io/rpg-cards/generator/generate.html"
  homepage "https://github.com/Samasaur1/RPG-card-generator"
  url "https://github.com/Samasaur1/RPG-card-generator/releases/download/v0.4.1/cardgen-0.4.1.tar.gz"
  sha256 "a68e7ba04268f6e90844f49937a1d1c3f1095ca1ebe7da1899f5c617452eb856"
  version "0.4.1"

  bottle :unneeded
  
  def install
    bin.install "cardgen"
    system "#{bin}/cardgen", "RPGSTDLIB"
  end
end
