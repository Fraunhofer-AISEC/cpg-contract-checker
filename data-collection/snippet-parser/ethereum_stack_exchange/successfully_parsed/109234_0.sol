
pragma solidity ^0.8.2;

import "@openzeppelin/contracts@4.3.0/token/ERC721/ERC721.sol";    
import "@openzeppelin/contracts@4.3.0/access/Ownable.sol";        

contract MyToken is ERC721, Ownable {
    uint256 public totalCount;                          
    uint256 public mintedCount;                         
    mapping(uint256 => bool) private tokenAvailablity;  

    constructor() public ERC721("MyToken", "MTKN") {
        totalCount = 2000;              
        mintedCount  = 0;               

        
        for(uint256 i = 0; i<=totalCount; i++)
            tokenAvailablity[i] = true; 
    }
}

