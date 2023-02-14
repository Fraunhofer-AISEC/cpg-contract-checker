  pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";

import "../Component.sol";

  
contract Issuer is ERC721, ERC721Enumerable, Ownable,  AccessControl, ComponentRole, IERC721Receiver{
   uint256 public mintPrice = 0.5 ether;    
   constructor(IComponent e) ERC721("MyToken", "MTK")    {
        core = e;
   }
        
       function getContractAddress() public view returns(address) {
            return address(this);
        }

    function safeMint(address contractAddress, uint256 tokenId) public payable  {
          
        require(msg.value >= 0, "Not enough ETH to purchase NFT; check price!"); 
        _safeMint(address(this), tokenId);
        approve(contractAddress, tokenId);

    }

    

    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 tokenId
    ) internal override(ERC721, ERC721Enumerable) {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable, AccessControl)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }

    function tokensOfOwner(address _owner)external view  returns (uint[] memory) {
     uint tokenCount = balanceOf(_owner);
     uint[] memory tokensId = new uint256[](tokenCount);

     for (uint i = 0; i < tokenCount; i++) {

          tokensId[i] = tokenOfOwnerByIndex(_owner, i);

     }
     return tokensId;

}

function transferToken(address contractAddress, address to, uint256 tokenId)public{
     transferFrom( contractAddress,  to, tokenId);

}


 function onERC721Received(address, address, uint256, bytes memory) public virtual override returns (bytes4) {
        return this.onERC721Received.selector;
    }
}
