class Dockerase < Formula
    desc "Docker cleaning utility CLI"
    homepage "https://github.com/alessandrostone/dockerase"
    version "0.2.1"
    license "MIT"

    on_macos do
      on_arm do
        url "https://github.com/alessandrostone/dockerase/releases/download/v0.2.1/dockerase-aarch64-apple-darwin.tar.gz"
        sha256 "7fc4aaf13ddb5cdd5ff545e07514fe6bf0c93c48be05476b76b5eaa5791a21b1"
      end
      on_intel do
        url "https://github.com/alessandrostone/dockerase/releases/download/v0.1.0/dockerase-x86_64-apple-darwin.tar.gz"
        sha256 "ef1b0a634ce41ee2017099372265e42c9867626d15944e2b080270870373b947"
      end
    end

    on_linux do
      url "https://github.com/alessandrostone/dockerase/releases/download/v0.1.0/dockerase-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d1b27e947348d431e937c1fc4634dc00ec4ee50cbcacae26e36fe0b80b2eba8d"
    end

        # Build from source
    head "https://github.com/alessandrostone/dockerase.git", branch: "main"

    depends_on "rust" => :build if build.head?

    def install
      if build.head?
        system "cargo", "install", *std_cargo_args
      else
        bin.install "dockerase"
      end
    end

    test do
      assert_match "dockerase", shell_output("#{bin}/dockerase --version")
    end

  end
