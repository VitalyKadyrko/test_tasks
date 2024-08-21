def generate_sorted_random_sample(sample_size, upper_bound)
  sample = (0...upper_bound).to_a.sample(sample_size)
  sorted_sample = sample.sort
  sorted_sample.each { |num| puts num }
end

puts "Введите количество чисел, которые нужно вывести:"
sample_size = gets.to_i

puts "Введите верхнюю границу диапазона чисел (не включительно):"
upper_bound = gets.to_i

puts 'Итоговый масив:'
generate_sorted_random_sample(sample_size, upper_bound)