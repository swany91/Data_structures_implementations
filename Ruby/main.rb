require_relative './Linked_List.rb'

single_list = LinkedList.new()

single_list.insert(5)
single_list.insert(8)
single_list.insert(1)
single_list.insert(3)

single_list.traverse

single_list.deleteAtIndex(2)
