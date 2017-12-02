require_relative "request_handler"

module Codepanda
  class Server
    def self.init
      server = GRPC::RpcServer.new
      server.add_http2_port("0.0.0.0:50051", :this_port_is_insecure)
      server.handle(Codepanda::RequestHandler)
      puts "Server is started"

      server
    end
  end
end
