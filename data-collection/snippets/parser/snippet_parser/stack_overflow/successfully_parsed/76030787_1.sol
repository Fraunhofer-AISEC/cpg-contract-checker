
pragma solidity ^0.8.9;

import "@openzeppelin/contracts@4.8.3/token/ERC721/ERC721.sol";

contract Example_credential2 is ERC721 {

    uint256 public MINT_PRICE = 0.005 ether;


    uint256 public tokenCounter;
    constructor() public ERC721("Example_credential2", "EC2") {
        tokenCounter = 0;
    }

    function createCollectible(string memory tokenURI) public returns (uint256){
        uint256 newItemId = tokenCounter;
        _safeMint(msg.sender, newItemId);
        tokenCounter = tokenCounter + 1;
        return newItemId;
    }

}

