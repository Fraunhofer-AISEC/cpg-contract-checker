pragma solidity ^0.8.4;

import '@openzeppelin/contracts/token/ERC721/ERC721.sol';
import '@openzeppelin/contracts/access/Ownable.sol';

contract PaperRebelsNFT is ERC721, Ownable{
    uint256 public mintPrice; 
    uint256 public totalSupply; 
    uint256 public maxSupply; 
    uint256 public maxPerWallet; 
    bool public isPublicMintEnabled; 
    string internal baseTokenUri;  
    address payable public withdraWallet; 
    mapping (address => uint256) public walletMints;

    constructor() payable ERC721('PaperRebelsNFT', 'RP'){
        mintPrice = 0.02 ether;
        totalSupply = 0;
        maxSupply = 1000;
        
        withdraWallet = payable(0xe9cec453d8234f156Aef67018704237b0DE8EB79);
    }

    function withdraw() external onlyOwner{
            (bool success, ) = withdraWallet.call{value: address(this).balance}('');
            require(success, 'withdraw failed');
    }
}
