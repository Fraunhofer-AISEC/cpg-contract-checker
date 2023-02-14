
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract Example is ERC721 {

    uint256 private _tokenId = 0;

    function mint(uint256 tokenURI, uint256 id) public payable returns(uint256){
        require(msg.value == 1 ether);
        require(id > 0);
        
        _tokenId += 1;
        _mint(msg.sender, _tokenId);
        _setTokenURI(_tokenId, tokenURI);
        return _tokenId;
    }
}
