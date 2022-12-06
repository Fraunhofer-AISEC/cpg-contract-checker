function buy(uint256 _tokenId, address payable _owner, uint256 _amount) public payable {
    address payable buyer = msg.sender; 
    address payable owner = _owner;  
    
    _transfer(ownerOf(_tokenId), buyer, _tokenId);
      
    owner.transfer(_amount); 

}
