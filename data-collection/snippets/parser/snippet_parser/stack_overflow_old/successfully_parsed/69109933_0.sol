pragma solidity ^0.8.0;


import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./IntelPropertyNFTInterface.sol";

contract IntelPropertyNFT is IntelPropertyNFTInterface, ERC721Enumerable, Ownable {

    constructor() ERC721Enumerable() ERC721("IntelPropertyNFT", "IPTNFT") public {
        
    }    
        

}
