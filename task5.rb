#Это известная Задача коммивояжера (TSP) https://habr.com/ru/articles/701458/
#Ниже написан код на руби, который позволяет точно и быстро решить эту задачу 
#методом динамического программирования для небольшого количества ячеек

require 'set'

def distance(cell1, cell2)
  (cell1[0] - cell2[0]).abs + (cell1[1] - cell2[1]).abs + (cell1[2] - cell2[2]).abs
end

def tsp(cells)
  n = cells.size
  start = [0, 0, 0] 
  
  all_cells = [start] + cells
  

  dp = Array.new(1 << n) { Array.new(n, Float::INFINITY) }
  parent = Array.new(1 << n) { Array.new(n, nil) }

  (1...n).each do |i|
    dp[1 << i][i] = distance(start, all_cells[i])
  end

  (1 << n).times do |mask|
    n.times do |i|
      next unless mask & (1 << i) != 0 
      n.times do |j|
        next unless mask & (1 << j) == 0 
        next_mask = mask | (1 << j)
        dist = dp[mask][i] + distance(all_cells[i], all_cells[j])
        if dist < dp[next_mask][j]
          dp[next_mask][j] = dist
          parent[next_mask][j] = i
        end
      end
    end
  end

  last = dp.last.each_with_index.min.last
  min_cost = dp.last[last] + distance(all_cells[last], start)

  mask = (1 << n) - 1
  path = [last]
  while mask > 0
    last = parent[mask][last]
    break unless last
    path << last
    mask ^= (1 << path.last)
  end

  route = path.reverse.map { |i| all_cells[i] }

  { route: route, cost: min_cost }
end

cells = [[1, 0, 0], [2, 2, 1], [1, 3, 3], [0, 4, 2]] 
result = tsp(cells)

puts "Оптимальный путь:"
result[:route].each_with_index do |cell, idx|
  puts "Шаг #{idx + 1}: Направляйтесь к ячейке с координатами #{cell}"
end
puts "Суммарная оптимальная дистанция: #{result[:cost]}"