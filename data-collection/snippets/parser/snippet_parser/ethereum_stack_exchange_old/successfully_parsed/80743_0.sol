pragma solidity >=0.4.22 <0.7.0;

contract TestNode { 
    uint[] nodes;

    function createNode(uint data) public {
        nodes.length = 0; 
        nodes.push(data);
    }

    function pushNode(uint data) public {
        nodes.push(data);
    }

    function getNode() public view returns(uint[] memory) {
        return nodes;
    }
}
