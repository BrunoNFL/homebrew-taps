class GeminiPolyglot < Formula
  desc "The multilingual bridge for AI agents in Gemini CLI"
  homepage "https://github.com/BrunoNFL/GeminiPolyglot"
  url "https://github.com/BrunoNFL/GeminiPolyglot/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "ef25c6ad0c148720c94a837f12b3d95b9e3d313f89056bf960693f70285e45fa"
  license "MIT"

  option "with-global", "Install globally and add integration to ~/.gemini/gemini.md automatically"
  option "with-workspace", "Install in current directory and add integration to ./gemini.md automatically"

  def install
    libexec.install Dir["*"]
    # We link the setup script as the main binary
    bin.install_symlink libexec/"scripts/setup.sh" => "gemini-polyglot"
  end

  def caveats
    return if build.with?("global") || build.with?("workspace")

    <<~EOS
      GeminiPolyglot was installed! 
      
      To complete the linguistic setup and speak every AI language, run:
        gemini-polyglot
        
      Or use a flag for automated setup:
        gemini-polyglot --install-global
    EOS
  end

  test do
    system "#{bin}/gemini-polyglot", "--help"
  end
end
