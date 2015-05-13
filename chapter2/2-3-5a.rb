require "open-uri"

open("http://www.oiax.jp/") do |f|
  f.each_line { |line| puts line }
end
