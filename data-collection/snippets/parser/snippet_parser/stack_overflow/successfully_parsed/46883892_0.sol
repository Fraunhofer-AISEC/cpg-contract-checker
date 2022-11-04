pragma solidity ^0.4.24;


contract LinkedList {

    struct Node {       
        string data;
        uint pointPrevNode;
        uint pointNextNode; 
    }

    mapping(uint => Node) public nodes;
    uint public nodeNumber = 0;
    uint public count = 1;

    function setData(string _data) public {
        nodes[count].data = _data;
        assignPointers(count);  
    }

    function assignPointers(uint _count) internal {
        nodes[nodeNumber].pointNextNode = _count;
        nodes[_count].pointPrevNode = nodeNumber;
        nodeNumber = _count;
        count++;
    }

}
