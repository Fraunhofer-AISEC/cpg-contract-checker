constructor (ChampTokenSale _tokenContract, uint256 _tokenPrice) public { 
    admin = msg.sender; 
    tokenContract = _tokenContract; 
    tokenPrice = _tokenPrice; 
}
