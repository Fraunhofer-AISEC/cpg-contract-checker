    pragma solidity ^0.8.4;

    contract SimpleMintToken is ERC721, ERC721URIStorage, Ownable {

    using Counters for Counters.Counter;
    using Strings for uint256;
    Counters.Counter private _tokenIdCounter;

    constructor() ERC721("SimpleMintToken", "SIMPLEMINT") {}


    string internal BASE_URI;
    string internal STAKED_BASE_URI;
}