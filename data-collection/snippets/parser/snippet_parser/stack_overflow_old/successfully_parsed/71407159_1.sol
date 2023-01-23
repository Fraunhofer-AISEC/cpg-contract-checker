pragma solidity ^0.8;


import "@openzeppelin/contracts/token/ERC721/ERC721.sol";


contract MyCollection is ERC721 {
    
    constructor() ERC721("MyCollection", "MyC") {}

    function mintCardNFT() external {
        
        _safeMint(msg.sender, 1);
    }
}
