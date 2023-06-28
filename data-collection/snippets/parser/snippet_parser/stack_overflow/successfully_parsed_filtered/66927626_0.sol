pragma solidity ^0.6.6;

import "https://github.com/MuhammadSajid404/ERC721-Token/blob/master/ERC721.sol";

contract PetShop is ERC721 {
    
      uint256 public tokenId;
      uint256 public prevOwnerTokenID;
      
      mapping(uint256 => uint256) public priceMapping;
      mapping(uint256 => bytes32) tokenIdToOffchainContentHash;
      
      event PetGenerated(address, uint256, uint256, bytes32);
      event BuyPet(uint256, address, address);
      event SuccessfulEtherWithdrawal(uint256, address, bool);
      
       constructor() public
        ERC721("ShanBuilders", "SBRS")
        {}
     
       function generatePet(uint256 _petPrice, bytes32 contentHash) public returns(bool) {
         
         require(msg.sender != address(0), "Please! Check back! Registeration should not be from zero address");
         require(msg.sender == ownerA, "Only contract owner can generate more pets");
         
         tokenId++;
         require(tokenId <= 16, "More than 16 pets is not allowed");
         
         priceMapping[tokenId] = _petPrice;
         tokenIdToOffchainContentHash[tokenId] = contentHash;
         _mint(ownerA, tokenId);
         emit PetGenerated(ownerA, tokenId, _petPrice, contentHash);
         return true;
       }
       
       function checkPrice(uint256 _tokenId) public view returns(uint256) {
           return priceMapping[_tokenId];
       }
       
       function checkHashForAToken(uint256 _tokenId) public view returns(bytes32) {
           return tokenIdToOffchainContentHash[_tokenId];
       }
       
       function buyPet(uint256 _tokenId) public payable returns(bool, string memory) {
           
           prevOwnerTokenID = _tokenId;
           address buyer = msg.sender;
           address _owner = ownerOf(prevOwnerTokenID);
           
           require(buyer != address(0), "Should not be zero address");
           require(_exists(prevOwnerTokenID), "Invalid property Id, not registered");
           require(msg.value == checkPrice(prevOwnerTokenID), "Please Send The Required Value");
           
           withDraw(msg.value);
            _transfer(_owner, buyer, prevOwnerTokenID);
           emit BuyPet(_tokenId, _owner, buyer);
           return (true, "Succesful");
       }
       
       function withDraw(uint256 _amount) public returns(bool) {
       
        address _owner = ownerOf(prevOwnerTokenID);
        require(_amount > 0, "Amount must be valid");
        
        payable(_owner).transfer(_amount);
        emit SuccessfulEtherWithdrawal(_amount, _owner, true);
        return true;
    }
     
}
