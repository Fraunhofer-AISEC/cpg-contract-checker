pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/Counters.sol";


contract ContractName is ERC721URIStorage, Pausable, ReentrancyGuard, Ownable {

   function FuncName(string memory _top, string memory _content, string memory _bottom) public nonReentrant payable returns (string memory) {

      using Counters for Counters.Counter;
      Counters.Counter private _tokenIds;
