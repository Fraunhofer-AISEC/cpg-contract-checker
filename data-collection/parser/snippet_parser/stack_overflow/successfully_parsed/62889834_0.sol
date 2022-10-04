pragma solidity >=0.4.25 <0.7.0;
pragma experimental ABIEncoderV2;

contract SaveHash {
    event HashSaved(uint id);
    Hash[] hashes;
    function save(Hash memory hash) public {
        
        emit HashSaved(hashes.length - 1);
    }
}
