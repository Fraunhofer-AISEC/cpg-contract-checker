pragma solidity ^0.4.6; 









contract ObjectTree {

    bytes32 public treeRoot;

    struct NodeStruct {
        bool isNode;
        bytes32 parent; 
        uint parentIndex; 
        bytes32[] children; 
        
    }

    mapping(bytes32 => NodeStruct) public nodeStructs;

    event LogNewNode(address sender, bytes32 nodeId, bytes32 parentId);
    event LogDelNode(address sender, bytes32 nodeId);

    function ObjectTree() {
        treeRoot = newNode(0);
    }

    function isNode(bytes32 nodeId)
        public
        constant
        returns(bool isIndeed)
    {
        return nodeStructs[nodeId].isNode;
    }

    function newNode(bytes32 parent) 
        public
        returns(bytes32 newNodeId)
    {
        if(!isNode(parent) && parent > 0) throw; 
        newNodeId = sha3(parent, msg.sender, block.number);
        NodeStruct memory node;
        node.parent = parent;
        node.isNode = true;
        
        if(parent>0) {
            node.parentIndex = registerChild(parent,newNodeId);
        }
        nodeStructs[newNodeId] = node;
        LogNewNode(msg.sender, newNodeId, parent);
        return newNodeId;
    }

    

    function registerChild(bytes32 parentId, bytes32 childId)
        private
        returns(uint index)
    {
        return nodeStructs[parentId].children.push(childId) - 1;
    }

    
    
    
    

    function pruneBranch(bytes32 nodeId)
        public
        returns(bool success)
    {
        bytes32 parent = nodeStructs[nodeId].parent;
        uint rowToDelete = nodeStructs[nodeId].parentIndex;
        uint rowToMove = nodeStructs[parent].children.length-1; 
        nodeStructs[parent].children[rowToDelete] = nodeStructs[parent].children[rowToMove];
        nodeStructs[nodeStructs[parent].children[rowToMove]].parentIndex = rowToMove;
        nodeStructs[parent].children.length--;
        nodeStructs[nodeId].parent=0;
        nodeStructs[nodeId].parentIndex=0;
        nodeStructs[nodeId].isNode = false;
        LogDelNode(msg.sender, nodeId);
        return true;
    }

    function getNodeChildCount(bytes32 nodeId)
        public
        constant
        returns(uint childCount)
    {
        return(nodeStructs[nodeId].children.length);
    }

    function getNodeChildAtIndex(bytes32 nodeId, uint index) 
        public 
        constant
        returns(bytes32 childId)
    {
        return nodeStructs[nodeId].children[index];
    }

}
