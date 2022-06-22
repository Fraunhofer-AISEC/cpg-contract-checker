pragma solidity 0.5.16;

import "./HitchensOrderStatisticsTree.sol";

contract Nearest {

    using HitchensOrderStatisticsTreeLib for HitchensOrderStatisticsTreeLib.Tree;
    HitchensOrderStatisticsTreeLib.Tree tree;

    

    function insert(uint value, bytes32 key) public {
        tree.insert(key,value);
    }

    function nearest(uint search) public view returns (uint value) {
        uint rank = tree.rank(search);
        value = tree.atRank(rank);

        

        if(search != value && rank > 0) rank -= 1;
        value = tree.atRank(rank);

        
    }
}
