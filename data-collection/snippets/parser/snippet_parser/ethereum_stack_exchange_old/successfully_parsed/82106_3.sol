
pragma solidity >0.8.5;

import "node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "node_modules/@openzeppelin/contracts/utils/Counters.sol";

contract MyContract {

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    mapping(uint    => ERC721) contracts;
    mapping(address =>   uint) lastContractIds;

    function myLastTokenId(address player) public view returns (uint256) {
        return lastContractIds[player];
    }

    function mint(address player, string memory sym, string memory desc) public returns (uint256) {
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();
        contracts[newItemId] = new ERC721(sym, desc);
        lastContractIds[player] = newItemId;
        return newItemId;
    }

}
