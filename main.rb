require "pry-rescue"

10000.times do |i|
  print i
  STDOUT.flush
  print "\n" if i % 8 == 7
  sleep 0.2
end