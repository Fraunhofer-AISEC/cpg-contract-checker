
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155URIStorage.sol";

contract Token is ERC1155URIStorage {
 using Counters for Counters.Counter;
 Counters.Counter private _tokenIds;
function createAd(string memory _uri,address receiver) external payable{
    _tokenIds.increment();
    uint256 newTokenId = _tokenIds.current();
    _mint(receiver, newTokenId, 1, "");
    _setURI(newTokenId, _uri);
    Ad memory newAd = Ad(
        newTokenId,
        _uri,
        receiver,
        new address[](0),
        false,
        0,
        0
    );
    ads[newTokenId] = newAd;
    emit AdCreated(newTokenId, _uri, receiver);
}
}