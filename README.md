# Important Note
I've moved away from Homebrew, and was never able to find a nice way to automate bottles, or some of my projects at all. I have no plans to remove any of these formula, nor will I be disabling any actions/workflows that automatically update them. But as of right now (October 2022), I am considering them abandoned, and guarantee no maintenance or support. While I may return to supporting some or all of them in the future, this is also not guaranteed.

However, since all the projects currently in this repository are Swift projects, you can install them with [Mint](https://github.com/yonaskolb/Mint)!

<blockquote>

# homebrew-core
My core Homebrew formulas

## Adding a formula
1. Tag a version of the project
3. Run `brew create https://github.com/Samasaur1/$REPO/archive/$TAG.tar.gz --tap Samasaur1/core`
4. Fill in `desc` and `homepage` if they aren't what you want
5. Define your install step

It should look similar to this:
```ruby
class Typer < Formula
  desc "An automatic typer for any text you give it"
  homepage "https://github.com/Samasaur1/TyperTool"
  url "https://github.com/Samasaur1/TyperTool/releases/download/v1.0.0/typer-1.0.0.tar.gz"
  sha256 "ef51c8bec87929fdad367c93b6c6c7208a1b08808d91992e8d6f9ff03f04b1cb"
  version "1.0.0"

  bottle :unneeded
  
  def install
    bin.install "typer"
  end
end
```
or this:
```ruby
class Typer < Formula
  desc "An automatic typer for any text you give it"
  homepage "https://github.com/Samasaur1/TyperTool"
  url "https://github.com/Samasaur1/TyperTool/archive/v1.0.0.tar.gz"
  sha256 "95b3f196446e9236a5aa305c69dfe09230b5cc2cba8290b72323b0f4549dd412"
  version "1.0.0"
  head "https://github.com/Samasaur1/TyperTool.git"
  revision 1

  depends_on :xcode
  
  def install
    # fixes an issue an issue in homebrew when both Xcode 9.3+ and command line tools are installed
    # see more details here https://github.com/Homebrew/brew/pull/4147
    ENV["CC"] = Utils.popen_read("xcrun -find clang").chomp

    build_path = "#{buildpath}/.build/release/typer"
    ohai "Building Typer"
    system("swift build --disable-sandbox -c release -Xswiftc -static-stdlib")
    bin.install build_path
  end
end
```

## Updating a formula

### New software version
1. Remove the formula file from `/usr/local/Homebrew/Library/Taps/samasaur1/homebrew-core/Formula`.
2. Tag a version of the project
3. Run `brew create https://github.com/Samasaur1/$REPO/archive/$TAG.tar.gz --tap Samasaur1/core`
4. Fill in `desc` and `homepage` if they aren't what you want
5. Define your install step

### Revising formula only
1. Make your change
2. Increment the `revision` attribute. If it doesn't exist, add the line `revision 1`

## Reference
https://github.com/syhw/homebrew/blob/master/Library/Contributions/example-formula.rb
https://github.com/yonaskolb/Beak/blob/master/Formula/beak.rb
</blockquote>
