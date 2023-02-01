pragma solidity ^0.4.4;

contract AddressArray {

    address[] addresses;

    function AddressArray(uint dummy1, address[] addresses_, uint dummy2) {
        for (uint i = 0; i < addresses_.length; i++) {
            addresses.push(addresses_[i]);
        }
    }

    function getNumberOfAddresses() constant returns (uint) {
        return addresses.length;
    }

    function getAddress(uint i) constant returns (address) {
        return addresses[i];
    }
}
