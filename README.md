# Binary Search Tree
## Turing Module 1: Project 3 (Echo)

### Overview

The project creates a binary search tree by adding nodes (the first node being the 'head' node) with possible left and right links one at a time to the tree. A node is added to the left link if it is smaller than the current value and added to the right link if it is larger than the current value.

The tree uses recursive methods that are located in the nodes, thus making each node 'intelligent' in that it passes along a query to one or both of its links. Nodes have no knowledge of any incoming links, only of their outgoing left and right links.

### Available Tree Methods

* *insert:* :  
