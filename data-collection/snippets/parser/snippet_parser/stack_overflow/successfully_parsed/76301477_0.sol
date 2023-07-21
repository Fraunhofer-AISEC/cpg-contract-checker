

pragma solidity ^0.8.1;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyNFTCollection is ERC721, Ownable {
    uint256 public constant MAX_NFTS = 10;
    uint256 public constant PRICE = 0.01 ether;
    uint256 public nextTokenId = 1;

    constructor() ERC721("MyNFTCollection", "MYNFT") {}

    function mint() public payable {
        require(nextTokenId < MAX_NFTS, "Maximum number of NFTs minted");
        require(msg.value >= PRICE, "Not enough Ether sent");

        _safeMint(msg.sender, nextTokenId);
        nextTokenId++;
    }

    function withdraw() public onlyOwner {
        uint256 balance = address(this).balance;
        payable(msg.sender).transfer(balance);
    }

}
