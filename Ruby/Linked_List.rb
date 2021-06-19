=begin
Implementation of Singly linked list
Basic Operations implemented
- Insertion:
    -By index
    -at end of list
- Delete by index
- Traversal
- Clear List
- showHead
- Get length
- Check item is in list(search)

assumption: a list that has no fixed size
# to make O(1) for insertion, include a pointer to tail
=end
require_relative './Node.rb'

class LinkedList
    attr_accessor :head, :tail
    attr_reader :length
    def initialize()
        @head = nil
        @tail = nil
        @length = 0
    end

    #inserts at end of list
    def insert(data)
        node_to_insert = SinglyListNode.new(data, nil)
        if @head.nil? && @tail.nil?
            # both and head and tail is empty so make data both
            @head = node_to_insert
            @tail = @head
        else 
            @tail.nextNode = node_to_insert
            @tail = node_to_insert
        end
        @length += 1
    end

    #inserts at a given index in the list. if index is way bigger curr length, 
    #insert at end of list
    def insertAtIndex(index, data)
        node_to_insert = SinglyListNode.new(data, nil)
        counter = 0
        if index == 0
            node_to_insert.nextNode = @head
            @head = node_to_insert
        elsif index < 0
            puts "index cannot be negative"
            return
        elsif index >= @length 
            self.insert(data)
        else
            #we need a pointer to a prev node
            current = @head
            prev = nil
            until counter == index
                counter += 1
                prev = current
                current = current.nextNode
            end
            prev.nextNode = node_to_insert
            node_to_insert.nextNode = current
        end
        @length += 1
    end

    def lengthOfList()
        return @length
    end

    #loop through list to show items
    def traverse()
        current = @head
        until current.nil?
            puts current.data
            current = current.nextNode
        end
    end

    #show head (first) of list
    def showHead()
        puts "head is #{@head.data}"
    end

    #show end item of list (tail)
    def showTail()
        puts "tail is #{@tail.data}"
    end

    def IsIteminList(value)
        current = @head
        until current.nil?
            if current.data == value
                return true
            end
            current = current.nextNode
        end
        return false
    end

    def deleteAtIndex(index)
        counter = 0
        if index == 0
            @head = @head.nextNode
        elsif index < 0
            puts "index cannot be negative"
            return
        #if index is way bigger than curr length, 
        #remove last item
        else
            #we need a pointer to a prev node
            current = @head
            prev = nil
            until counter == index || current.nextNode.nil?
                counter += 1
                prev = current
                current = current.nextNode
            end
            if current.nextNode == nil
                prev.nextNode = nil
                @tail = prev
            else
                prev.nextNode = current.nextNode
            end
        end
        @length -= 1
    end

    def clearList()
        self.initialize
    end
end
