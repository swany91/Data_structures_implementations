=begin
Implementation of Binary Search Tree
Basic Operations implemented
- add child
- check if item in tree (search)
- in-order traversal. order: (left, root, right)
  Algorithm
    1. start
    2. If left, Go left and print data. (repeat process)
    3. if no left, print root data
    4. then go right and repeat process.

- pre-order traversal. order: (root, left, right)
  Algorithm
    1. start
    2. print root data
    3. If left, Go left (repeat entire process)
    4. if no left, then go right and repeat entire process.
- post-order traversal. order: (left, right, root)
  Algorithm
    1. start
    2. If left, Go left and print data (repeat entire process)
    3. if no left, then go right and print data (repeat entire process)
    4. then print root data
- level-order traversal (breadth first search)
  Algorithm
    1. start
    2. initialize queue
    3. add self to queue
    4. pop data from queue and add children to queue
    5. repeat process
- delete item
  Algo
   1. if item is less, go to left node else right node
   2. if item has no children(left or right), return nil
   3. if it has children, for that side (either left or right),
      find either min_value for right side and max_value for left side
   4. Copy value from process 3 to the node you are trying to delete
   5. Delete value from process 3. (repeat process with new data)

=end

class Binary_Search_Tree
    attr_accessor :data
    attr_accessor :left_node
    attr_accessor :right_node
    def initialize(data)
        @data = data
        @left_node = nil
        @right_node = nil
    end

    def add_child(data)
        #if data is less than parent/root go left else 
        #go right
        if data == self.data
            return
        end
        if data < self.data
            if self.left_node
                #repeat
                self.left_node.add_child(data)
            else
                self.left_node = Binary_Search_Tree.new(data)
            end
        else
            #data is greater so right
            if self.right_node
                #repeat
                self.right_node.add_child(data)
            else
                self.right_node = Binary_Search_Tree.new(data)
            end
        end
    end

    def in_Tree(data)
        if data == self.data
            return TRUE
        end
        if data < self.data
            if self.left_node
                return self.left_node.in_Tree(data)
            else
                return FALSE
            end
        else
            if self.right_node
                return self.right_node.in_Tree(data)
            else
                return FALSE
            end
        end
    end

    def in_order_traversal()
        elements = []
        if self.left_node
            elements += self.left_node.in_order_traversal()
        end
        elements.push(self.data)
        if self.right_node
            elements += self.right_node.in_order_traversal()
        end
        return elements
    end

    def pre_order_traversal()
        elements = []
        elements.push(self.data)
        if self.left_node
            elements += self.left_node.pre_order_traversal()
        end
        if self.right_node
            elements += self.right_node.pre_order_traversal()
        end
        return elements
    end

    def post_order_traversal()
        elements = []
        if self.left_node
            elements += self.left_node.post_order_traversal()
        end
        if self.right_node
            elements += self.right_node.post_order_traversal()
        end
        elements.push(self.data)
        return elements
    end

    def level_order_traversal(queue = Queue.new)
        elements = []
        queue << self
        while not(queue.empty?)
            current = queue.pop()
            elements.push(current.data)
            if current.left_node
                queue << current.left_node
            end
            if current.right_node
                queue << current.right_node
            end
        end
        return elements
    end

    def find_max()
        if self.right_node
            self.right_node.find_max()
        else
            return self.data
        end
    end

    def find_min()
        if self.left_node
            self.left_node.find_min()
        else
            return self.data
        end
    end

    def calculate_sum()
        sum = 0
        if self.left_node
            sum += self.left_node.calculate_sum()
        end
        if self.right_node
            sum += self.right_node.calculate_sum()
        end
        sum += self.data
        return sum
    end

    def delete_item(data)
        if data < self.data
            if self.left_node
                #repeat process
                self.left_node = self.left_node.delete_item(data)
            end
        elsif data > self.data
            if self.right_node
                #repeat process
                self.right_node = self.right_node.delete_item(data)
            end
        elsif data == self.data
            if self.left_node == nil and self.right_node == nil
                return nil
            elsif self.left_node == nil
                return self.right_node
            elsif self.right_node == nil
                return self.left_node
            end
            max_value_left = self.left_node.find_max()
            self.data = max_value_left
            #delete duplicate node by repeating entire process
            self.left_node = self.left_node.delete_item(max_value_left)
        end
        return self
    end
end


def build_tree(elements)
    puts "Building tree with these elements: #{elements}"
    root = Binary_Search_Tree.new(elements[0])
    for index in 1...elements.length() do
        root.add_child(elements[index])
    end
    return root
end