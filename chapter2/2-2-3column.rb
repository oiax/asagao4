def stopwatch(time)
  start = Time.now.to_f
  time.times {|i| yield i }
  Time.now.to_f - start
end

secs = stopwatch(10000) do |i|
  Math.sqrt(i)
end
puts "#{secs}秒かかりました。"
