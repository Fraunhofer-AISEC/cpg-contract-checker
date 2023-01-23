pragma solidity 0.6.1;

contract TestNode { 
    uint[] nodes;

    function createNode(uint data) public {
        delete nodes; 
        nodes.push(data);
    }

    function pushNode(uint data) public {
        nodes.push(data);
    }

    function getNode() public view returns(uint[] memory) {
        return nodes;
    }
}
