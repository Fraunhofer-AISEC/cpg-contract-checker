

pragma solidity >= 0.8.17;

import "../@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "../@openzeppelin/contracts/utils/Counters.sol";
import "../@openzeppelin/contracts/access/Ownable.sol";
import "../@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract HelloWorld is ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;
...
}
