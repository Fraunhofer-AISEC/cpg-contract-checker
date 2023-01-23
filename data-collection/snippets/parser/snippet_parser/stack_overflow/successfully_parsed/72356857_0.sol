
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract MyNFT is ERC721URIStorage {
    uint private _counter;
    address private _owner;

    constructor() ERC721("My NFT", "MNFT") {
      _owner = msg.sender;
    }

    function owner() public view returns (address) {
      return _owner;
    }

    function mintNFT(address recipient, string memory tokenURI)
        public returns (uint256)
    {
        require(msg.sender == owner(), "Only owner is allowed to mint");
        uint newItemId = ++_counter;
        ERC721._mint(recipient, newItemId);
        ERC721URIStorage._setTokenURI(newItemId, tokenURI);

        return newItemId;
    }
}
