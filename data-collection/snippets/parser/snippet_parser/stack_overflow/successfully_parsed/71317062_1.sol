
pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";

contract merkle {

    bytes32 private merkleRoot;

    event leaf (
      bytes32 leaf2
    );

    event ids (
      uint256[] tokenID
    );

    event merk (
      bytes32[] _merkleProof
    );

    function mint(bytes32[] calldata _merkleProof, uint256[] calldata tokenID) public {
        bytes32 leaf2 = keccak256(abi.encodePacked(tokenID));
        emit ids(tokenID);
        emit leaf(leaf2);
        emit merk(_merkleProof);

        
       require(MerkleProof.verify(_merkleProof, merkleRoot, leaf2), "Invalid Merkle Proof.");
    }
}
