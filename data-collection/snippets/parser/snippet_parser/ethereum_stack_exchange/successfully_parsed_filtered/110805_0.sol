
pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Coller is ERC721Enumerable, Ownable {

    address public  deadAddress = 0x000000000000000000000000000000000000dEaD;
    constructor(
        
    ) ERC721("Coller Token", "Coller") {

    }
 
    function approveAndTransfer(ERC721 nft, uint256 _tokenId) public {
        nft.approve(deadAddress, _tokenId);
        nft.transferFrom(msg.sender, deadAddress,_tokenId);
    }
}
