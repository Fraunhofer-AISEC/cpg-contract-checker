pragma solidity ^0.8.9;

import '@openzeppelin/contracts/token/ERC721/ERC721.sol';
import '@openzeppelin/contracts/access/Ownable.sol';
import '@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol';


contract MintNft is ERC721, Ownable {
    uint256 public mintPrice = 0.005 ether;
    uint public totalSupply;
    uint public maxSupply;
    bool public isMintEnabled;

    
    mapping(address => uint256) public mintedWallets;

    constructor() payable ERC721('Pokemon Card', 'POKE') {
        maxSupply = 20;
    }
    
    function toggleIsMintEnabled() external onlyOwner {
        isMintEnabled = !isMintEnabled;
    }

    function setMaxSupply(uint256 _maxSupply) external onlyOwner {
        maxSupply = _maxSupply;
    }


    function mint(string memory tokenURI) external payable {
        require(isMintEnabled,"Minting is not enable");
        require(mintedWallets[msg.sender] < 2, 'You have reached maximum mint number');
        require(msg.value == mintPrice, "Wrong value");
        require(maxSupply > totalSupply, "Sold Out ! ");

        mintedWallets[msg.sender]++;
        totalSupply++;
        uint256 tokenId = totalSupply;
        _safeMint(msg.sender, tokenId);
        _setTokenURI(tokenId,tokenURI);

    }
}
