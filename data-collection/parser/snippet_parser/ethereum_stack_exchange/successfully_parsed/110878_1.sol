

pragma solidity ^0.8.4;

import "@openzeppelin/contracts/proxy/Clones.sol";

import "./MetaCoin.sol";

contract MetaCoinFactory {

    event UsersContractCreated(address);    
    address immutable tokenImplementation;

    constructor(){
    tokenImplementation = address(new MetaCoin());
    }

    function createToken() public returns (address) {
    address clone = Clones.clone(tokenImplementation);
    MetaCoin(clone).initialize(msg.sender);
        emit UsersContractCreated(clone);
    return clone;
    }
}
