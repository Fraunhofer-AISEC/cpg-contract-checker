pragma solidity 0.5.1;

import "https://github.com/0xcert/ethereum-erc721/src/contracts/tokens/nf-token.sol";

contract ItemMarket is ERC721 {
  struct Item {
    string name;
    uint[3] traits;
  }

  Item[] public items;

  function createItem(string memory name, uint[3] memory traits) public {
    items.push(Item({name:name, traits:traits})) - 1;
  }
}
