**struct ExtensionNode {
    
    mapping(int => Node) bNode;
    
    bytes32 commonPrefix;    
    
}
struct BranchNode {
    
    ExtensionNode exNode;
    
    LeafNode lfObject;
    uint8 nodeType; 
    }
struct Node{
  BranchNode[15] brNode;
  bytes32 value;
  bool flag;
}
  struct LeafNode {
    bytes32 value;
    bytes32 postfix;
}
Node rootNode;**
