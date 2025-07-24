class Agentup < Formula
  include Language::Python::Virtualenv

  desc "A tool for building and deploying AI agents"
  homepage "https://github.com/RedDotRocket/AgentUp"
  url "https://files.pythonhosted.org/packages/a2/2b/7179dfe6041849ea6d155f06f5c1bbcbae78849114ad5e3464921bb11f54/agentup-0.3.0.tar.gz"
  sha256 "39c59031f8432bf8c795f58bdb4c18caa6ab11c046b90d6d2178fdc0fbde7d8a"

  depends_on "python@3.11"

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/agentup", "--help"
  end
end
