
pragma solidity ^0.8.4;


import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";


contract NFT is ERC721URIStorage {
    
    uint public tokenCount;

    constructor() ERC721("EOR NFT", "EOR"){}

    function mint(string memory _tokenURI) external returns(uint){
        tokenCount += 1;
        
        
        _safeMint(msg.sender, tokenCount);
        _setTokenURI(tokenCount, _tokenURI);
        return(tokenCount);
    }
}
