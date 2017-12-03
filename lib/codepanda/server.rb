require_relative "request_handler"

module Codepanda
  class Server
    PORT = ENV.fetch("CODEPANDA_PORT", "50051")

    def self.init
      server = GRPC::RpcServer.new
      server.add_http2_port("0.0.0.0:#{PORT}", :this_port_is_insecure)
      server.handle(Codepanda::RequestHandler)
      puts "*Codepanda is listening on tcp://0.0.0.0:50051"

      server
    end
  end
end
