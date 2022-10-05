pragma solidity ^0.5.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract NFT is ERC721, Ownable {
     address payable public _owner;
     mapping (uint => bool) public sold;
     mapping (uint => uint) public price;

     event Purchase(address owner, uint price, uint id, string uri);

     constructor() ERC721("Dapp University", "DAPPU") public{
        _owner = msg.sender;
     }

     function mint(string memory _tokenURI, uint _price) public onlyOwner returns (bool) {
         uint _tokenId = totalSupply() + 1;
         price[_tokenId] = _price;

         _mint(address(this), _tokenId);
         _setTokenURI(_tokenId, _tokenURI);
    
         return true;
     }

     function buy(uint _id) external payable {
         _validate(_id); 
         _trade(_id); 
    
         emit Purchase(msg.sender, price[_id], _id, tokenURI(_id));
     }

     function _validate(uint _id) internal {
         require(_exists(_id), "Error, wrong Token id"); 
         require(!sold[_id], "Error, Token is sold"); 
         require(msg.value >= price[_id], "Error, Token costs more"); 
     }

    function _trade(uint _id) internal {
        _transfer(address(this), msg.sender, _id); 
        _owner.transfer(msg.value); 
        sold[_id] = true; 
     }
}
