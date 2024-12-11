require 'drb/drb'

# Define the object that will communicate with the client
class HelloWorld
  def greet
    "Hello World!"
  end
end

# The address where the server will listen
URI = "druby://0.0.0.0:8787"  # Use 0.0.0.0 to make it available for other containers

# Create the server
server = HelloWorld.new

# Register the server at the URI
DRb.start_service(URI, server)

# Keep the server running
puts "Server is running at #{URI}..."
DRb.thread.join
