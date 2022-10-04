pragma solidity ^0.4.0;

contract A {
    struct Node { 
        uint256 value;
        bytes32 nextNode;
    }
    bytes32 head;
    mapping(bytes32 => Node) list;

    function push(uint256 value) public {
        bytes32 key = keccak256(abi.encodePacked(value, head));
        Node memory newNode = Node(value, head);

        list[key] = newNode;
        head = key;
    }

    function headValue() public view returns(uint256) {
        require(head != 0);

        return list[head].value;
    }

    function sum() public view returns(uint256) {
        bytes32 current = head;
        uint256 total = 0;
        while (current != 0) {
            total += list[current].value;
            current = list[current].nextNode;
        }

        return total;
    }

}
