pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NFTCollectibel is Ownable, ERC721{

    uint256 public totalSupply=0;
    uint256 constant public MAx_AMOUNT = 10000 

    constructor() ERC721 ("TRACKS", "TR"){
        for(uint i=0; i<50; i++)
    {
    -_safeMint(msg.sender, ++totalSupply);
    }

    }
    

}
