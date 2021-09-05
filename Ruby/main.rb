# require_relative './Linked_List.rb'
require_relative './Hash_Table.rb'

# single_list = LinkedList.new()

# single_list.insert(5)
# single_list.insert(8)
# single_list.insert(1)
# single_list.insert(3)

# single_list.traverse

# single_list.deleteAtIndex(2)

dictionary = HashTable.new(10)

dictionary.insertItem("Jan 17", 27)
# puts dictionary.getItem("Jan 17")
dictionary.deleteItem("Jan 17")
puts dictionary.getItem("Jan 17")


