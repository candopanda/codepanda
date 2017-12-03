require "grpc"
require_relative "code_execution_services_pb"

module Codepanda
  class Client
    SERVER_URL = ENV.fetch("CODEPANDA_SERVER_URL", "localhost:50051")
    attr_reader :stub
    private :stub

    def initialize
      @stub = Codepanda::CodeExecution::Stub.new(SERVER_URL, :this_channel_is_insecure)
    end

    def execute(source_code)
      stub.execute(Codepanda::SourceCodeRequest.new(code: source_code))
    end
  end
end
