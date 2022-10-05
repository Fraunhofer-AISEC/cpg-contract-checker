

pragma solidity ^0.8.0;

import "./ERC721Tradable.sol";


contract Creature is ERC721Tradable {
    constructor(address _proxyRegistryAddress)
        ERC721Tradable("Curious Cats", "CC", _proxyRegistryAddress)
    {}

    function baseTokenURI() override public pure returns (string memory) {
        return "https://ayudh37.pythonanywhere.com/curious_cats/";
    }

    function contractURI() public pure returns (string memory) {
        return "https://creatures-api.opensea.io/contract/opensea-creatures";
    }
}

