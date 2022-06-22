pragma solidity ^0.4.4;

contract Adoption {

    address[] public adopters;

    function adopt(uint petId) public returns (uint) {

        require(petId >= 0 && petId <= 15);

        adopters[petId] = msg.sender;

        return petId;
    }
}
