require "spec_helper"
require "server"
require "client"

RSpec.describe "Client - server communication" do
  let(:server) { Codepanda::Server.init }
  let!(:start_server) { fork { server.run } }

  it "handles client requests" do
    code = File.expand_path("../../fixtures/hello_server.c", __FILE__)
    sleep 0.2
    execute = Codepanda::Client.new.execute(File.read(code))
    Process.kill(9, start_server)

    expect(execute.result).to eq("Hello, Server!")
  end
end
