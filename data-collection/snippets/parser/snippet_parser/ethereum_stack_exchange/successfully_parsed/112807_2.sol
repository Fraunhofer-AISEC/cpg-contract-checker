pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";

contract Recover{

    function reedemToken(uint _amount, bytes32 _hash, bytes memory _signature) public view {
        
        if(ECDSA.recover(_hash, _signature) != msg.sender) {
            revert("Signature does not match message sender");
        } 
    }
}
