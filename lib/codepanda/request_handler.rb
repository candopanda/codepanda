require "grpc"
require_relative "code_execution_services_pb"
require_relative "execute"

module Codepanda
  class RequestHandler < Codepanda::CodeExecution::Service
    def execute(source_code_request, _unused_call)
      result = Codepanda::Execute.new(source_code_request.code).process
      Codepanda::ExecutedResult.new(result: result.output, success: result.success)
    end
  end
end
