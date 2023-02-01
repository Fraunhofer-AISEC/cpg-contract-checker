
pragma solidity 0.7.0;

pragma experimental ABIEncoderV2;

import "IntervalTree.sol";

contract IntervalBets {
    using IntervalTree for IntervalTree.Tree;
    using IntervalTree for IntervalTree.Node;
    
    IntervalTree.Tree tree;
    IntervalTree.Node[] nodes;
    
    event Interval(uint[2] interval);
    
    constructor() {
        tree.add(0, 50, msg.sender);
        tree.add(51, 320, msg.sender);
        tree.add(321, 500, msg.sender);
        
        tree.add(11, 111, msg.sender);
        tree.add(0, 3, msg.sender);
        tree.add(33, 320, msg.sender);
        tree.add(599, 9001, msg.sender);
        tree.add(9, 9999, msg.sender);
        tree.add(99, 8899, msg.sender);
        tree.add(1, 42, msg.sender);
        tree.add(13, 666, msg.sender);
        tree.add(0, 2, msg.sender);
        tree.add(3, 5, msg.sender);
        tree.add(7, 9, msg.sender);
        tree.add(9, 11, msg.sender);
        tree.add(3, 12, msg.sender);
        tree.add(3, 12, msg.sender);
        tree.add(1001, 10001, msg.sender);
    }
    
    function bet(uint a, uint b) public {
        tree.add(a, b, msg.sender);
    }
    
    function check(uint v) public {
        tree.search(v, nodes);
        
        for (uint i=0; i<nodes.length; i++) {
            
            
            emit Interval([nodes[i].i.a, nodes[i].i.b]);
        }

        delete nodes;
    }
}
