contract Adoption {
    Pet[16] pets;

    struct Pet {
        address owner;
        uint256 price;
    }

    function returnEth() public payable {
    msg.sender.transfer(msg.value);
    }
    
    function adopt(uint petId) public payable returns (uint) {
        require(petId >= 0 && petId <= 15);
        require(msg.value >= pets[petId]['price'] * 0.5);
        pets[petId] = Pet({owner: msg.sender, price: 100});
        return petId;
        
    }
    
    function getAdopters() public view returns (Pet[16]) {
        return pets;
    }


}
