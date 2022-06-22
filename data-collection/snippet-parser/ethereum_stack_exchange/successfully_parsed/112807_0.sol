pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";
import "./TokenERC20.sol";

contract InstanceCoin{

    address contractInstance;

    constructor(address _contract){
        contractInstance = _contract;
    }

    function reedemToken(uint _amount, bytes32 _hash, bytes memory _signature) public {
        
        if(ECDSA.recover(_hash, _signature) == msg.sender)
            revert("is correct");
        else 
            revert("is not correct"); 
    }
}
