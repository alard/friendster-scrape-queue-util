require "rubygems"
require "redis"

redis = Redis.new

pid = Process.pid

until File.exists?("STOP")
  if id = redis.lpop("friendster:queue")
    system("./bff.sh #{ id } cookies_#{ pid }.txt")
  else
    puts "Wait for id..."
    sleep 1
  end
end

