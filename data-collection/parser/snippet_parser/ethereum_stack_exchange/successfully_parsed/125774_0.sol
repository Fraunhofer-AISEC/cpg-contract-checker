
pragma solidity >=0.7.0 <0.9.0;

import '@openzeppelin/contracts/token/ERC721/ERC721.sol';
import '@openzeppelin/contracts/access/Ownable.sol';

contract SimpleMintContract is ERC721, Ownable {
   uint256 public mintPrice = 0.00 ether;
   uint256 public totalSupply;
   uint256 public maxSupply;
   bool public isMintEnabled;
   mapping(address => uint256) public mintedWallets;

   constructor() payable ERC721('Simple Mint', 'SIMT') {
       maxSupply = 2;
   }
       

function toggleIsMintEnabled() external onlyOwner {
     isMintEnabled = !isMintEnabled;
    }

    function setMaxSupply(uint256 maxSupply_) external onlyOwner {
        maxSupply = maxSupply_;
    }

    function mint() external payable {
        require(isMintEnabled, 'minting not enabled');
        require(mintedWallets[msg.sender] < 1, 'exceeds max per wallet' ) ;
        require(msg.value == mintPrice, 'wrong value');
        require(maxSupply > totalSupply, 'sold out');

        mintedWallets[msg.sender]++;
        totalSupply++;
        uint256 totalId = totalSupply;
        _safeMint(msg.sender, tokenId);
    }
}
