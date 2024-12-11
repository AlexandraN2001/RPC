require 'drb/drb'
require 'timeout'

URI = "druby://rpc-server:8787"

def connect_to_server
  Timeout.timeout(10) do  # 10 seconds timeout for the connection
    DRbObject.new_with_uri(URI)
  end
rescue Timeout::Error, DRb::DRbConnError
  puts "Connection failed. Retrying..."
  sleep 2  # Wait 2 seconds before retrying
  retry
end

# Try to connect to the server
server = connect_to_server

# Call the `greet` method from the server
puts server.greet

# Wait indefinitely to keep the container alive
puts "Press Ctrl+C to exit"
sleep
