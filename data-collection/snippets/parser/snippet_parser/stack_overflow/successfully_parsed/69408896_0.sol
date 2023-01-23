pragma solidity ^0.5.0;

import "./ERC721Full.sol";

contract MemoryToken is ERC721Full{
 address public shopOwner;
 constructor() ERC721Full('Memory Token', 'MEMORY') public {

}

  function balanceOf()  public view returns(uint){
   return address(this).balance;
   }

 function withdraw()  public payable {
   require(msg.sender == shopOwner, 'only shopOwner can withdraw');
   msg.sender.transfer(address(this).balance);

  }

  function mint(address _to, string memory _tokenURI ) public payable 
    returns(bool){
     
     uint _tokenId= totalSupply().add(1);
     _mint(_to, _tokenId);
    _setTokenURI(_tokenId, _tokenURI);
    return true;

    }
  }
