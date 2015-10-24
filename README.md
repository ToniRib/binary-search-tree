# Binary Search Tree
## Turing Module 1: Project 3 (Echo)

### Overview

The project creates a binary search tree by adding nodes (the first node being the 'head' node) with possible left and right links one at a time to the tree. A node is added to the left link if it is smaller than the current value and added to the right link if it is larger than the current value.

The tree uses recursive methods that are located in the nodes, thus making each node 'intelligent' in that it passes along a query to one or both of its links. Nodes have no knowledge of any incoming links, only of their outgoing left and right links.

### Available Tree Methods

* *insert(value):* inserts the given value as a new node into the tree
* *include?(value):* returns true if the value exists in the tree & false if it doesn't
* *depth_of(value):* returns the depth of the given value in the tree, with a depth of 1 being the head node. Returns an error message if the value doesn't exist in the tree.
* *maximum:* returns the maximum value in the tree & nil if the tree is empty
* *minimum:* returns the minimum value in the tree & nil if the tree is empty
* *sort:* returns an array of all of the tree values sorted from smallest to largest. Returns an error message if the tree is empty.
* *count:* returns the number of nodes in the tree
* *max_height:* returns the maximum height of the tree (depth of lowest node)
