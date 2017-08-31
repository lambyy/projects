require 'rack'

basic_app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new

  text = req.path_info
  res['Content-Type'] = 'text/html'
  res.write(text)
  res.finish
end

Rack::Server.start(
  app: basic_app,
  Port: 3000
)
