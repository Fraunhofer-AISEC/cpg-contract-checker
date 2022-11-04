pragma solidity ^0.8.16;

import "erc721a/contracts/ERC721A.sol";

contract test123 is ERC721A {
    constructor() ERC721A("test123", "test123") {}

    function mint(uint256 quantity) external payable {
        
        _mint(msg.sender, quantity);
    }

    function _baseURI() override internal view virtual returns (string memory) {
        return "ipfs://bafybeigshu4xqcajjkbqw24cea6shz2vh7dibp7yowjmxo4yg32aoma123/";
    }
}
