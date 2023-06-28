pragma solidity ^0.8.0;


contract test {
    uint256[] starsForSale;
    
    function ownerOf(uint256 some) public returns(address){
        return msg.sender;
    }
    
    function _transfer(address from, address _to, uint256 amount) public {
        
    }
    

    function buyStar(uint256 _tokenId) public payable {
        require(starsForSale[_tokenId] > 0, "The star must be available for sale!"); 
        uint256 starPrice = starsForSale[_tokenId]; 
        address starOwner = ownerOf(_tokenId); 
        require(msg.value >= starPrice, "You need to have sufficient funds!"); 
        _transfer(starOwner, msg.sender, _tokenId);
        address payable starOwnerAddressPayable = payable(starOwner);
        starOwnerAddressPayable.transfer(starPrice);
        if(msg.value > starPrice) {
            payable(msg.sender).transfer(msg.value - starPrice);
        }
    }
}
