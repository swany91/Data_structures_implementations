=begin
Implementation of General Tree
Basic Operations implemented
- add child
- print tree

assumption: no collision happens
keys are strings so getting the ascii of characters first, then finding
the modulo of the result by the length of all items - as hash function
=end

class Tree
    attr_accessor :children
    attr_accessor :parent
    attr_accessor :data
    def initialize(data)
        @children = []
        @parent = nil
        @data = data
        # @designation = designation
    end

    def add_child(child)
        @children.push(child)
        child.parent = self
    end

    def get_level(level = 0)
        parent = self.parent
        while parent
            level += 1
            parent = parent.parent
        end
        return level
    end

    def print_tree()
        puts self.data
        if self.children
            @children.each { |child|
                child.print_tree()
            }
        end
    end

    def pretty_print_tree()
        design = self.parent ? "___|" : " "
        puts ' ' * self.get_level() * 3 + design + self.data
        if self.children
            @children.each { |child|
                child.pretty_print_tree()
            }
        end
    end

    def pretty_print_according_to_level(level)
        design = self.parent ? "___|" : " "
        puts ' ' * self.get_level() * 3 + design + self.data
        if level == self.get_level()
            return
        end
        if self.children
            @children.each { |child|
                child.pretty_print_according_to_level(level)
            }
        end
    end

end

def tree_build_structure()
    root = Tree.new("Global")

    india = Tree.new("India")

    gujarat = Tree.new("Gujarat")
    gujarat.add_child(Tree.new("Ahmedabad"))
    gujarat.add_child(Tree.new("Baroda"))

    karnataka = Tree.new("Karnataka")
    karnataka.add_child(Tree.new("Bangluru"))
    karnataka.add_child(Tree.new("Mysore"))

    india.add_child(gujarat)
    india.add_child(karnataka)

    usa = Tree.new("USA")

    nj = Tree.new("New Jersey")
    nj.add_child(Tree.new("Princeton"))
    nj.add_child(Tree.new("Trenton"))

    california = Tree.new("California")
    california.add_child(Tree.new("San Francisco"))
    california.add_child(Tree.new("Mountain View"))
    california.add_child(Tree.new("Palo Alto"))

    usa.add_child(nj)
    usa.add_child(california)

    root.add_child(india)
    root.add_child(usa)
    root.pretty_print_tree()
    return root
end