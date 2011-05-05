require "rubygems"
require "redis"

redis = Redis.new

previous = [ redis.llen("friendster:queue") ] * 4

loop do
  left = redis.llen("friendster:queue")
  prev = previous.shift
  per_second = (prev - left) / 120.0
  puts "%0.3f per second  --  %d left  --  %0.3f minutes" % [ per_second, left, left / (60 * per_second) ]
  previous << left

  sleep 30
end

