num = rand 10
case num
when 0
  puts "大吉です。"
when 1, 2, 3
  puts "中吉です。"
when 4, 5, 6
  puts "吉です。"
when 7, 8
  puts "凶です。"
else
  puts "大凶です。"
end
