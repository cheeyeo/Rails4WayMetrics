require "rack"

class StreamingRack
  def call(env)
    [200, {'Content-Type' => 'text/html'}, self]
  end

  def each
    while true
      yield "Hello Rack!\n"
    end
  end
end

run StreamingRack.new
