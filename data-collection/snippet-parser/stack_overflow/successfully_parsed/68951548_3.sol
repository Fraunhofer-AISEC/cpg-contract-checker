

pragma solidity ^0.8.0;

import "./ERC721Tradable.sol";



contract Creature is ERC721Tradable{
    constructor(address _proxyRegistryAddress)
        ERC721Tradable("ExampleNFT", "EXA", _proxyRegistryAddress)
    {}

    function baseTokenURI() override public pure returns (string memory) {
        return "https://example.com/api/token/";
    }

    function contractURI() public pure returns (string memory) {
        return "https://creatures-api.opensea.io/contract/opensea-creatures";
    }
    
    
}
