class Dockerase < Formula
    desc "Docker cleaning utility CLI"
    homepage "https://github.com/alessandrostone/dockerase"
    url "https://github.com/alessandrostone/dockerase/archive/refs/tags/v0.1.0.tar.gz"
    sha256 "7b9d1b25ec456002e7c838ed32f781999ed6767d9d0c6e5b1a36130c5b9069e8"
    license "MIT"

    depends_on "rust" => :build

    def install
      system "cargo", "install", *std_cargo_args
    end

    test do
      assert_match "dockerase", shell_output("#{bin}/dockerase --version")
    end
  end