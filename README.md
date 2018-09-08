# homebrew-core
My core Homebrew formulas

## Adding a formula
Copy this:
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
Change the `desc`, `homepage`, `url`, `sha256`, and `version`.

| Attribute | Notes |
| --------- | ----- |
| `desc` | A one-sentence description of the formula |
| `homepage` | Points to the project site (if applicable) or the GitHub repository |
| `url` | Points to a tarball (`.tar.gz` file) containing the tool. To create a tar file, run `tar -cvf tarname-1.0.0.tar /path/to/directory`. |
| `sha256` | The SHA256 checksum for the tarball. Obtain it by running `shasum -a 256 tarname-1.0.0.tar` |
| `version` | The version of the formula |

## Updating a formula
Simply replace the `url`, `sha256`, and `version` attributes with the correct ones. **Don't worry about overwriting the formula, that's what you are supposed to do.**

## Reference
https://github.com/syhw/homebrew/blob/master/Library/Contributions/example-formula.rb
