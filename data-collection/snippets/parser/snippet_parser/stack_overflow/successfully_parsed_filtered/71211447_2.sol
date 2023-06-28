
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/presets/ERC721PresetMinterPauserAutoId.sol";

contract HmtNFT is ERC721PresetMinterPauserAutoId {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor(string memory name, string memory symbol, string memory baseTokenURI)
        ERC721PresetMinterPauserAutoId(name, symbol, baseTokenURI)
    {}
}
