pragma solidity ^0.4.21;

contract Tree {
    struct Node {
        bytes data;
        uint256 parent;
        uint256[] children;
    }

    Node[] nodes;

    function Tree() public {
        
        nodes.push(Node("", 0, new uint256[](0)));
    }

    function appendChild(uint256 parentID, bytes data) public returns (uint256 newID) {
        newID = nodes.length;

        nodes.push(Node({
            data: data,
            parent: parentID,
            children: new uint256[](0)
        }));

        nodes[parentID].children.push(newID);

        return newID;
    }
}
