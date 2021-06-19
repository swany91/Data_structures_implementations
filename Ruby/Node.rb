# A node class for use by other data structures

class SinglyListNode
    attr_accessor :data, :nextNode
    def initialize(data, nextNode)
        @data = data
        @nextNode = nextNode
    end
end
