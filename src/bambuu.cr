module Bambuu
    class API
        def initialize(host : String = "127.0.0.1" , port : Int32 = 80, debug : Bool = false)
            @host = host
            @port = port
            @debug = debug
            @server = HTTP::Server.new("127.0.0.1", 8080, [
                HTTP::ErrorHandler.new,
                HTTP::LogHandler.new,
                HTTP::StaticFileHandler.new("."),
            ])
        end

        def run
            puts "Listening on http://#{@host}:#{@port}"
            @server.listen
        end
    end
end