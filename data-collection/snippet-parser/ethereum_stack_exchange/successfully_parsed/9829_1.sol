function getNode(address addr , bytes32[] fields) internal returns (Node storage) {
    Node node = realms[addr];
    for (uint i = 0; i < fields.length; i ++) {
      node = node.nodes[fields[i]];
    }
    return node;
}
