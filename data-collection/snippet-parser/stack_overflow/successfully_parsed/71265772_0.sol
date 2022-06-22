


pragma solidity ^0.8.7;

import "contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "contracts/access/Ownable.sol";

contract TheStripesNFT is ERC721Enumerable, Ownable {
    using Strings for uint256;

    string public baseURI;
    string public baseExtension = ".json";
    uint256 public cost = 0.1 ether;
    uint256 public presaleCost = 0.08 ether;
    uint256 public maxSupply = 40;
    uint256 public maxMintAmount = 10;
}