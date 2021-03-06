# NOTE: This thing isn't secure. It's just for demo purposes.
# Don't use this in production. It's not even close to secure. See README.md

require "socket"
require "active_support/all"
require_relative "request"
require_relative "response"

port = ENV.fetch("PORT") { 2000 }.to_i
server = TCPServer.new(2000)

puts "Listening on port #{port}..."

def render(path)
  full_path = File.join(__dir__, "views", path)
  if File.exists?(full_path)
    Response.new(code: 200, body: File.binread(full_path))
  else
    Response.new(code: 404, body: "File Not Found")
  end
end

def route(request)
  if request.path == "/"
    render "index.html"
  else
    render request.path
  end
end


loop do
  Thread.start(server.accept) do |client|
    request = Request.new client.readpartial(2048)
    response = route(request)
    response.send(client)
    client.close
  end
end
