
LCD_SEGMENTS = {
  '0' => [" - ", "| |", "   ", "| |", " - "],
  '1' => ["   ", "  |", "   ", "  |", "   "],
  '2' => [" - ", "  |", " - ", "|  ", " - "],
  '3' => [" - ", "  |", " - ", "  |", " - "],
  '4' => ["   ", "| |", " - ", "  |", "   "],
  '5' => [" - ", "|  ", " - ", "  |", " - "],
  '6' => [" - ", "|  ", " - ", "| |", " - "],
  '7' => [" - ", "  |", "   ", "  |", "   "],
  '8' => [" - ", "| |", " - ", "| |", " - "],
  '9' => [" - ", "| |", " - ", "  |", " - "]
}

def print_lcd_number(number, size)
  rows = Array.new(5) { "" }

  number.each_char do |digit|
    pattern = LCD_SEGMENTS[digit]

    rows[0] += pattern[0][0] + pattern[0][1] * size + pattern[0][2] + " "
    rows[1] += pattern[1][0] + pattern[1][1] * size + pattern[1][2] + " "
    rows[2] += pattern[2][0] + pattern[2][1] * size + pattern[2][2] + " "
    rows[3] += pattern[3][0] + pattern[3][1] * size + pattern[3][2] + " "
    rows[4] += pattern[4][0] + pattern[4][1] * size + pattern[4][2] + " "
  end

  rows[0] += "\n"
  rows[4] += "\n"


  puts rows[0]

  size.times { puts rows[1] }

  puts rows[2]

  size.times { puts rows[3] }

  puts rows[4]
end

size = 2
args = ARGV.dup

if args[0] == "-v"
  size = args[1].to_i
  args.shift(2)
end

number = args[0]

if number && number.match?(/\A\d+\z/)
  print_lcd_number(number, size)
else
  puts "Введите: 'ruby test3.rb -v x n' x - размер цифр (количество линий в каждом элементе числа), n - число, которое нужно вывести"
end