contract Adoption {
    address[16] public adopters;

    function returnEth() public payable {
    msg.sender.transfer(msg.value);
    }
    
    function adopt(uint petId) public payable returns (uint) {
        require(petId >= 0 && petId <= 15);
        
        adopters[petId] = msg.sender;
        returnEth();
        return petId;
        
    }
    
    function getAdopters() public view returns (address[16]) {
        return adopters;
    }


}
