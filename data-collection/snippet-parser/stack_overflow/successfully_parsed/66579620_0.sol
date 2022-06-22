pragma solidity ^0.5.0;

contract Adoption {
    address[16] public adopters;

    
    function adopt(uint petId) public returns (uint) {
        require(petId >= 0 && petId <= 15);
        require(adopters[petId] == address(0), "already adopted pet");
        adopters[petId] = msg.sender;

        return petId;
    }

    
    function getAdopters() public view returns (address[16] memory) {
        return adopters;
    }
    
    
    function deleteAdopter(uint petId) public returns(uint) {
        require(msg.sender == adopters[petId], "Only adopters can call this function");
        delete adopters[petId];
        return petId;
    }
}












