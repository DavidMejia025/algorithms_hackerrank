#!/bin/ruby

#
# Complete the roadNetwork function below.
#

#
# For the weighted graph, <name>:
#
# 1. The number of nodes is <name>_nodes.
# 2. The number of edges is <name>_edges.
# 3. An edge exists between <name>_from[i] to <name>_to[i] and the weight of the edge is <name>_weight[i].
#
#
def roadNetwork(road_nodes, road_from, road_to, road_weight)
    i = 0
    result = road_from.reduce([]) do |accu, from|
      accu << road_weight[i]
        accu << search_to(road_to[i], road_from, road_to, road_weight)
        i+=1
        accu
    end  
    p "result: #{result}"
   result
end
def search_to(node, from, to, weight)
    i = 0
    find_edge = from.reduce([]) do |accu, edge| 
        if node == edge 
            accu << weight[i]
        else
            accu << 0
        end
        i += 1
        accu
    end
    p "f edge : #{find_edge}"
    find_edge
end
#fptr = File.open(ENV['OUTPUT_PATH'], 'w')

road_nodes, road_edges = gets.strip.split(' ').map(&:to_i)

road_from = Array.new road_edges
road_to = Array.new road_edges
road_weight = Array.new road_edges

road_edges.times do |road_itr|
    road_from[road_itr], road_to[road_itr], road_weight[road_itr] = gets.strip.split(' ').map(&:to_i)
end

result = roadNetwork(road_nodes, road_from, road_to, road_weight)

fptr.write result
fptr.write "\n"

fptr.close()