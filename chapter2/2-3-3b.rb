str = "The quick brown fox jumps over the lazy dog"
md = str.match(/(\S+) fox .+ (\S+) dog/)
if md
  puts "#{md[0]}とマッチしました。"
  puts "最初のかっこは#{md[1]}とマッチ。"
  puts "次のかっこは#{md[2]}とマッチ。"
end
