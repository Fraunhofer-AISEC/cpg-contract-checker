    pragma solidity >=0.8.4;

import "./ENS.sol";

contract EnsSubdomain {
    ENS public immutable ens;
    bytes32 public immutable rootNode;

    constructor(ENS ensAddr, bytes32 node) {
        ens = ensAddr;
        rootNode = node;
    }

    function createSubdomain(
        bytes32 label,
        address owner,
        address resolver,
        uint64 ttl
    ) public {
        ens.setSubnodeRecord(rootNode, label, owner, resolver, ttl);
    }
}
