# require_relative './Linked_List.rb'
# require_relative './Hash_Table.rb'
# require_relative './Tree.rb'
require_relative './Binary_Search_Tree.rb'


# single_list = LinkedList.new()

# single_list.insert(5)
# single_list.insert(8)
# single_list.insert(1)
# single_list.insert(3)

# single_list.traverse

# single_list.deleteAtIndex(2)

# dictionary = HashTable.new(10)

# dictionary.insertItem("Jan 17", 27)
# puts dictionary.getItem("Jan 17")
# dictionary.deleteItem("Jan 17")
# puts dictionary.getItem("Jan 17")

# root = tree_build_structure()

# root.pretty_print_tree()

BST_root = build_tree([15, 12, 27, 7, 14, 20, 23, 88])

BST_root.delete_item(14)

BST_root.delete_item(20)

BST_root.delete_item(7)

puts BST_root.in_order_traversal()