=begin
Implementation of HashTable
Basic Operations implemented
- Insertion / set item
- Delete by key
- Get by key

assumption: no collision happens
keys are strings so getting the ascii of characters first, then finding
the modulo of the result by the length of all items - as hash function
=end

class HashTable
    attr_reader :size
    attr_reader :items
    def initialize(size)
        @items = Array.new(size)
        @size = size
    end

    def hashFunction(key)
        accumulator = 0
        key.each_char {
            |char|
            accumulator += char.ord
        }
        return accumulator % size
    end

    def insertItem(key, value)
        index = self.hashFunction(key)
        @items[index] = value
    end

    def getItem(key)
        index = self.hashFunction(key)
        return @items[index]
    end

    def deleteItem(key)
        index = self.hashFunction(key)
        @items[index] = nil
    end


end
