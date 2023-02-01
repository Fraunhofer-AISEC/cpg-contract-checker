Node new_node;
new_node.data = d;
new_node.next = h.next;
new_node.prev = h.own;

uint newnode_addr;
assembly {
   newnode_addr := new_node
}
