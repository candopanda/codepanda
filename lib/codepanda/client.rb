require "grpc"
require_relative "code_execution_services_pb"

module Codepanda
  class Client
    attr_reader :stub
    private :stub

    def initialize
      @stub = Codepanda::CodeExecution::Stub.new("localhost:50051", :this_channel_is_insecure)
    end

    def execute(source_code)
      stub.execute(Codepanda::SourceCodeRequest.new(code: source_code))
    end
  end
end
