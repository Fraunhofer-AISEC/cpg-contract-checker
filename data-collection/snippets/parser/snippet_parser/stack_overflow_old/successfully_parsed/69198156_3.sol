
pragma solidity ^0.8.0;
 
contract Hash {
    function getHashValue_1() public view returns(bytes32){
        return keccak256(abi.encodePacked(uint256(234)));
    }
    
    
    function getHashValue_3() public view returns(bytes32){
        return keccak256(abi.encodePacked(uint256(10),string('StringSecretValue')));
    }
    
}
