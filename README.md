# Binary Search Tree
## Turing Module 1: Project 3 (Echo)

### Overview

The project creates a binary search tree by adding nodes (the first node being the 'head' node) with possible left and right links one at a time to the tree. A node is added to the left link if it is smaller than the current value and added to the right link if it is larger than the current value.

The tree uses recursive methods that are located in the nodes, thus making each node 'intelligent' in that it passes along a query to one or both of its links. Nodes have no knowledge of any incoming links, only of their outgoing left and right links.

Additionally, the tree allows only numbers (float or integer) or strings, but not both. Attempting to add a node whose data is a string to a tree whose head node contains a number will result in an error and the rejection of that node. This holds true if the head node is a string and the node trying to be added is a number. It is possible to continue adding nodes after a rejection, but they must be of the correct data type.

### Available Tree Methods

* *insert(value):* inserts the given value as a new node into the tree
* *include?(value):* returns true if the value exists in the tree & false if it doesn't
* *depth_of(value):* returns the depth of the given value in the tree, with a depth of 1 being the head node. Returns an error message if the value doesn't exist in the tree.
* *maximum:* returns the maximum value in the tree & nil if the tree is empty
* *minimum:* returns the minimum value in the tree & nil if the tree is empty
* *sort:* returns an array of all of the tree values sorted from smallest to largest. Returns an error message if the tree is empty.
* *count:* returns the number of nodes in the tree
* *count_leaves:* returns the number of leaves (nodes with no left or right link) in the tree
* *max_height:* returns the maximum height of the tree (depth of lowest node)
* *delete(value):* deletes the node in the tree with the given value. Returns an error message if the tree is empty or if the node doesn't exist. Uses the [in-order successor node](https://en.wikipedia.org/wiki/Binary_search_tree#Deletion) for the deletion.

### Example

```
bst = Tree.new
numbers = [10, 12, 8, 9, 6, 14, 11]
numbers.each do |num|
  bst.insert(num)
end

bst.include?(9)
=> true
bst.depth_of(11)
=> 3
bst.maximum
=> 14
bst.minimum
=> 6
bst.sort
=> [6, 8, 9, 10, 11, 12, 14]
bst.count
=> 7
bst.count_leaves
=> 4
bst.max_height
=> 3
bst.delete(12)
=> 14
bst.count
=> 6
bst.head.right.data
=> 14
```


### Test Suite

The Node and Tree classes each have a corresponding testing file written with [minitest](https://github.com/seattlerb/minitest) which can be run from the terminal using mrspec:

```
$ mrspec spec/tree_test.rb

Tree
  returns max height of zero if no head node
  raises exception if sorting empty tree
  returns count one if tree contains only head node
  inserts smaller node to left without overwriting head node
  returns sorted array of tree data
  returns minimum value in tree
  raises exception if value if not found
  returns maximum value in tree
  returns max height of tree
  returns nil as min value if no head exists
  can add a head node
  returns max height of one if tree contains only head node
  inserts larger node to right without overwriting head node
  returns one if value matches head
  returns count of nodes in tree
  returns head data as array if sorting tree with head only
  returns depth of value
  returns true if tree contains value
  returns false if tree does not contain value
  returns count zero if there is no head node
  head as max value if only head exists
  raises exception if no head exists
  inserts left and right nodes
  returns message if duplicate value inserted into tree
  returns false for include if tree is empty
  head as min value if only head exists
  returns nil as max value if no head exists

Failures:

Finished in 0.00477 seconds (files took 0.09594 seconds to load)
27 examples, 0 failures
```

You can also run all the tests at the same time by running the `mrspec` command from the terminal in the project's base directory.

#### Dependencies

Must have the [mrspec gem](https://github.com/JoshCheek/mrspec) and [minitest gem](https://github.com/seattlerb/minitest) installed.

Alternatively, you could run the tests without using mrspec by running the following commands:

```
$ ruby spec/node_test.rb
Run options: --seed 60846

# Running:

..............................................................

Fabulous run in 0.002682s, 23113.7074 runs/s, 27214.5264 assertions/s.

62 runs, 73 assertions, 0 failures, 0 errors, 0 skips

$ ruby spec/tree_test.rb
Run options: --seed 20622

# Running:

...........................

Fabulous run in 0.001972s, 13688.7962 runs/s, 20279.6981 assertions/s.

27 runs, 40 assertions, 0 failures, 0 errors, 0 skips
```
