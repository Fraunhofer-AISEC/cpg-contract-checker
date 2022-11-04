
pragma solidity ^0.7.0;

abstract contract BaseContract {
    
    address private immutable wallet;
    
    constructor(address _wallet) {

        require(_wallet != address(0), "address not set");

        wallet = _wallet;
    }    
}
