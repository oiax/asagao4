def put_messages(*messages)
  messages.each {|m| puts m }
end

put_messages "こんにちは", "さようなら"
