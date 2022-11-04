pragma solidity ^0.4.24;

contract Garbage {
    address[3] public addresses;
    uint idx;

    function addAddress(address _address) public {
        require(idx < addresses.length);

        addresses[idx] = _address;
        idx++;
    }
}
