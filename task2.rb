def word_break(s, d)
  dp = Array.new(s.length + 1, false)
  dp[0] = true

  (1..s.length).each do |i|
    (0...i).each do |j|
      if dp[j] && d.include?(s[j...i])
        dp[i] = true
        break
      end
    end
  end

  dp[s.length]
end

s = "двесотни"
d = ["две", "сотни", "тысяч"]

puts word_break(s, d) 