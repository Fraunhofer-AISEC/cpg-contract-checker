pragma solidity 0.5.14;

import "./HitchensUnorderedKeySet.sol";

contract DirectedGraph {

    using HitchensUnorderedKeySetLib for HitchensUnorderedKeySetLib.Set;

    HitchensUnorderedKeySetLib.Set nodeIds;

    struct NodeStruct {
        HitchensUnorderedKeySetLib.Set parents; 
        HitchensUnorderedKeySetLib.Set children; 
        uint weight;
        uint data1; 
    }

    mapping(bytes32 => NodeStruct) nodeStructs;

}

