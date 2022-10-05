pragma solidity ^0.4.24;

contract Garbage {

address[3] public addresses;


function addAddress(address _address) public {

    addresses.push(_address);

}
}