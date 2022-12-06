pragma solidity ^0.5.0;

import "./token/ERC721/ERC721Full.sol";
import "./drafts/Counters.sol"; 


contract MyContract is ERC721Full {

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721Full("MYToken", "MYT") public {          
    }

    function mint(address player) public returns (uint256) {

        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(player, newItemId);
        return newItemId;
    }
}
