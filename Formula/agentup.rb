class AgentUp < Formula
  include Language::Python::Virtualenv

  desc "AgentUp is a tool for building and deploying AI agents"
  homepage "https://github.com/RedDotRocket/AgentUp"
  url "https://files.pythonhosted.org/packages/agentup-0.3.0.tar.gz"
  sha256 "de918cfe4b8df435ea6ed3bf5e49bda86efc53a3e833fdffee8bef63aba173b5"

  depends_on "python@3.11"

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/agentup", "--help"
  end
end
