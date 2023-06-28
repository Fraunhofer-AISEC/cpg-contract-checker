pragma solidity ^0.4.6;

contract ObjectTree {

bytes32 public treeRoot;

struct NodeStruct {
    bytes32 parent; 
    uint parentIndex; 
    bytes32[] children; 
    
}

mapping(bytes32 => NodeStruct) nodeStructs;

event LogNewNode(bytes32 nodeId, bytes32 parentId);
event LogDelNode(bytes32 nodeId);

function ObjectTree() {
    treeRoot = newNode(0);
}

function newNode(bytes32 parent) 
    public
    returns(bytes32 newNodeId)
{
    
    

    newNodeId = sha3(parent, msg.sender, block.number);
    NodeStruct memory node;
    node.parent = parent;
    if(parent>0) {
        node.parentIndex = registerChild(parent,newNodeId);
    }
    nodeStructs[newNodeId] = node;
    LogNewNode(newNodeId, parent);
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
    LogDelNode(nodeId);
    return true;
}






function isActiveNode(bytes32 nodeId)
    public
    constant
    returns(bool isIndeed)
{
    if(nodeId==treeRoot) return true;
    if(nodeStructs[nodeId].parent==0) return false;
    return isActiveNode(nodeStructs[nodeId].parent);
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
