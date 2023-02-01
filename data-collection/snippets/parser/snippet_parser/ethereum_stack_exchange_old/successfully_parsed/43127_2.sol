pragma solidity ^0.4.21;

contract DoublyLinkedList {
    struct Node {
        bytes payload;
        uint256 next;
        uint256 prev;
    }

    uint256 nextNodeID = 1;  
    mapping(uint256 => Node) nodes;
    uint256 head;
    uint256 tail;
    uint256 count = 0;

    function append(bytes payload) public {
        if (tail == 0) {
            
            head = nextNodeID;
            tail = nextNodeID;
            nodes[nextNodeID].payload = payload;
        } else {
            nodes[tail].next = nextNodeID;
            nodes[nextNodeID].payload = payload;
            nodes[nextNodeID].prev = tail;
            tail = nextNodeID;
        }
        nextNodeID += 1;
        count += 1;
    }

    function validNode(uint256 nodeID) internal view returns (bool) {
        return nodeID == head || nodes[nodeID].prev != 0;
    }

    function remove(uint256 nodeID) public {
        require(validNode(nodeID));

        Node storage node = nodes[nodeID];

        
        if (tail == nodeID) {
            tail = nodes[nodeID].prev;
        }
        if (head == nodeID) {
            head = nodes[nodeID].next;
        }

        
        if (node.prev != 0) {
            nodes[node.prev].next = node.next;
        }

        
        if (node.next != 0) {
            nodes[node.next].prev = node.prev;
        }

        
        delete nodes[nodeID];

        count -= 1;
    }

    function getNodeIDs() public view returns (uint256[] ids) {
        ids = new uint256[](count);

        uint256 current = head;
        for (uint256 i = 0; i < count; i++) {
            ids[i] = current;
            current = nodes[current].next;
        }
    }

    function getPayload(uint256 nodeID) public view returns (bytes) {
        require(validNode(nodeID));

        return nodes[nodeID].payload;
    }
}
