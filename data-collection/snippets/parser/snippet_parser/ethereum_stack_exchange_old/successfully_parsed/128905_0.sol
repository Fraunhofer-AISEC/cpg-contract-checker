
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

contract StructDef {
    struct Edition {
        uint256 startIndex;
        uint256 endIndex;
        uint256 minted; 
        bytes32 merkleProof;
    }

    Edition[] public editions;

    function addEdition(
        uint256 startIndex,
        uint256 endIndex,
        bytes32 merkleProof
    ) public {
        editions.push(
            Edition({
                startIndex: startIndex,
                endIndex: endIndex,
                minted: 0,
                merkleProof: merkleProof
            })
        );
    }
}

contract StructDefTest {
    StructDef public structDef;

    function setUp() public {
        structDef = new StructDef();
    }

    function testEditions() public {
        structDef.addEdition(1, 10000, 0x0);
        structDef.addEdition(10001, 99999, 0x0);
        assert(structDef.editions.length == 2); 
    }
}

