
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Minter is ERC721, Ownable{

  string private baseTokenURI;
  uint256 public mintPrice;
    uint256 public totalSupply;
    uint256 public maxSupply;
    uint256 public maxPerWallet;
    bool public isPublicMintEnabled;
    
    address public withdrawWallet;
    mapping (address=> uint256) public walletMints;


    constructor()  payable ERC721("NFTTutorial", "NFT") {
  
        mintPrice= 1 ether;
        totalSupply = 0;
        maxSupply=14400;
        maxPerWallet= 25;
        withdrawWallet=0x658385eb2Abf80C76DEeF0d99491d41Fd7B638ff;
  }

      function setIspublicMintEnable( bool isPublicMintEnabled_) external onlyOwner{
        isPublicMintEnabled= isPublicMintEnabled_;

    }

      function mint(uint256 quantity_) public payable{
        require(isPublicMintEnabled,"minting not enabled");
        
        require(totalSupply+quantity_<= maxSupply,"sold out");
        require(walletMints[msg.sender]+ quantity_<= maxPerWallet);

        for (uint256 i=0; i <quantity_; i++){
            uint256 newTokenId=totalSupply+1;
            totalSupply++;
            walletMints[msg.sender] = walletMints[msg.sender] + quantity_; 
            _safeMint(msg.sender, newTokenId);
        }
    }

   
  function _baseURI() internal view virtual override returns (string memory) {
    return baseTokenURI;
  }

  
  function setBaseTokenURI(string memory _baseTokenURI) public {
    baseTokenURI = _baseTokenURI;
  }


   function withdraw(address payable _to, uint _amount) public {
        _to.transfer(_amount);
    }
}
