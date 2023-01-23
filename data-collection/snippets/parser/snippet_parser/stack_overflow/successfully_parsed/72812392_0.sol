    
pragma solidity ^0.8;
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
contract ImpactCollection is ERC721URIStorage {
    uint256 public tokenCounter;
    constructor () ERC721 ("Impact Tokens", "COLLECTION_TICKER"){
        tokenCounter = 0;
    }
    function concatenate(string memory a,uint256 memory b,string memory c) public pure returns (string memory){
        return string(abi.encodePacked(a,b,c));
    }

    function createCollectible() public returns (uint256) {
        uint256 newItemId = tokenCounter;
        string urinumber = string(abi.encodePacked(newItemId.toString()))
        tokenURI = "https://ipfs.io/ipfs/QmQh54Rb8ZFY33P9bWUzgonRvA7XeChVWaAWG3nMqQ19xW/" + urinumber + ".json";
        _safeMint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);
        tokenCounter = tokenCounter + 1;
        return newItemId;
    }

}
