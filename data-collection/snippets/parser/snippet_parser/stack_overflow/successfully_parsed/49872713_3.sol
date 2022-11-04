pragma solidity ^0.4.2;

contract Graph {
    address owner;

    struct GraphEdge {
        uint128 from;
        uint128 to;
    }

    GraphEdge[] public graph;
    bool public initialized = false;

    constructor() public {
        owner = msg.sender;
    }

    function addEdge(uint128 edgeFrom, uint128 edgeTo) public {
        require(!initialized);
        graph.push(GraphEdge({
            from: edgeFrom,
            to: edgeTo
        }));
    }

    function finalize() public {
        require(msg.sender == owner);
        initialized = true;
    }
}

contract ContractB {
    Graph graph;

    constructor(address graphAddress) public {
        Graph _graph = Graph(graphAddress);
        require(_graph.initialized());
        graph = _graph;
    }
}
