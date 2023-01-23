
pragma solidity ^0.8.0;

import "../../node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "../../node_modules/@openzeppelin/contracts/utils/Counters.sol";

contract MyContract is ERC721 {
    using Counters for Counters.Counter;
    Counters.Counter public _tokenIds;
    constructor() ERC721("My Token", "TOKEN") {

    }

    
    function tokenTransfer(address from, address to, uint256 tokenId) public {
        require(_isApprovedOrOwner(msg.sender, tokenId), "ERC721: transfer caller is not owner nor approved");
        _transfer(from, to, tokenId); 
    }

    
    function setOperator(address operator, bool approved) public {
        require(tx.origin != operator, "ERC721: approve to caller");
        _setApprovalForAll(tx.origin, operator, approved); 
    } 
}
