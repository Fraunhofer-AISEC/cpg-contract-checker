pragma solidity ^0.4.11;

contract AddressStore {
    address[] public bought;

    
    function setStore(address[] _addresses) public {
        bought = _addresses;
    }
}
