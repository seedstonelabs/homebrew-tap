# Rendered by scripts/render-formula.sh from a release's archives and
# checksums; the placeholders are filled, never edited by hand.
class Seedstone < Formula
  desc "In-memory key-value store speaking the Redis protocol, with optional persistence"
  homepage "https://github.com/stefanobaldo/seedstone"
  version "0.3.3"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/stefanobaldo/seedstone/releases/download/v0.3.3/seedstone-0.3.3-aarch64-apple-darwin.tar.gz"
      sha256 "96adeb70826eb1a7495d19b8c5be671f2d0f6dc4397f6a787f3c4c1297b276d7"
    end
    on_intel do
      url "https://github.com/stefanobaldo/seedstone/releases/download/v0.3.3/seedstone-0.3.3-x86_64-apple-darwin.tar.gz"
      sha256 "ce46620780f85f77652c83b60984fa80d4676d56250bb4f186f69fc5177fae5a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/stefanobaldo/seedstone/releases/download/v0.3.3/seedstone-0.3.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f2293ba2ce180505b083b7781b570341a59296720a6fdae3c26056f3bd56e7b2"
    end
    on_intel do
      url "https://github.com/stefanobaldo/seedstone/releases/download/v0.3.3/seedstone-0.3.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1e4a43f27edf1bb04ba8176555be35bed8d80221f7f0341c1ceccd9ccde5da1d"
    end
  end

  def install
    bin.install "seedstone"
    doc.install "README.md", "CHANGELOG.md"
  end

  service do
    run [opt_bin/"seedstone", "--data-dir", var/"seedstone"]
    keep_alive true
    working_dir var
    log_path var/"log/seedstone.log"
    error_log_path var/"log/seedstone.log"
  end

  test do
    assert_match "seedstone #{version}", shell_output("#{bin}/seedstone --version")
  end
end
