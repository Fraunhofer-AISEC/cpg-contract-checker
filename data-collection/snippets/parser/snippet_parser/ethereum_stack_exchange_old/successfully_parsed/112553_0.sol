pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract FloodFill is ERC721Enumerable, Ownable {

    uint256 public maxTokens;
    mapping(string => string) private tokenColor;


    constructor(string memory name, string memory symbol, uint256 maxNftSupply) ERC721(name, symbol) {
        maxTokens = maxNftSupply;
    }

    function setTokenColor(string memory tokeId, string memory color) public onlyOwner{
        tokenColor[tokeId] = color;
    }

    function returnTokenColor(string memory tokeId) public view returns (string memory){
        return tokenColor[tokeId];
    }

}
