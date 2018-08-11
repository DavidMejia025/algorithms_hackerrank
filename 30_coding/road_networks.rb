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
        accu << [road_weight[i], search_to(road_to[i], road_from, road_to, road_weight), search_before(road_to[i], road_from[i], road_from, road_to, road_weight)].reduce(:+)
        i += 1
        accu
    end  
   result.reduce(:*)
end
def search_to(node, from, to, weight)
    i = 0
    find_edge = from.reduce([]) do |accu, edge| 
        node == edge ? accu << weight[i] : accu << 0
        i += 1
        accu
    end
    find_edge.reduce(:+)
end

def search_before(node, node_from, from, to, weight)
  i = 0
    find_edge = to.reduce([]) do |accu, edge| 
        p "#{node}- #{edge} - #{node_from} --- #{from[i]}"
        node == edge && node_from != from[i]  ? accu << weight[i] : accu << 0
        i += 1
        accu
    end
    find_edge.reduce(:+)

end
# road_nodes, road_edges = gets.strip.split(' ').map(&:to_i)
# p "road_nodes: #{road_nodes} road_edges: #{road_edges}"
# road_from = Array.new road_edges
# road_to = Array.new road_edges
# road_weight = Array.new road_edges

# road_edges.times do |road_itr|
#     road_from[road_itr], road_to[road_itr], road_weight[road_itr] = gets.strip.split(' ').map(&:to_i)
# end
# p "#{road_nodes} #{road_from}, #{road_to}, #{road_weight}"
# result = roadNetwork(road_nodes, road_from, road_to, road_weight)
result = roadNetwork(3, [1,2,1], [2,3,3], [3,1,2])
p result