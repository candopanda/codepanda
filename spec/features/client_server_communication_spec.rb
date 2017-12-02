require "spec_helper"
require "server"
require "client"

RSpec.describe "Client - server communication" do
  let(:server) { Codepanda::Server.init }

  before do
    fork { server.run }
  end

  it "handles client requests" do
    code = File.expand_path("../../fixtures/hello_server.c", __FILE__)
    execute = Codepanda::Client.new.execute(File.read(code))

    expect(execute.result).to eq("Hello, Server!")
  end
end
