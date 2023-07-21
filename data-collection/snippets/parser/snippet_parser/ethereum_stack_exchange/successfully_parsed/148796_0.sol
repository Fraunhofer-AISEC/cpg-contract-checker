

pragma solidity ^0.8.19;
pragma experimental ABIEncoderV2;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract GameItem is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721("GameItem", "ITM") {}

    struct Test1 {
        string wallet_address;
        string counts;
    }

    mapping(address => uint) public nftOwners;
    mapping(address => uint) public usedCounts;

    function storeWalletAddress(Test1[] memory _arr) public pure {
        
        
        
        
    }
}
