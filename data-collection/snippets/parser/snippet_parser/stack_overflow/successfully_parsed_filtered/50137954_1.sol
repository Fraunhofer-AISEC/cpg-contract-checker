pragma solidity 0.4.18;

import 'zeppelin-solidity/contracts/ownership/Ownable.sol';

contract BlockBetGameRegistry is Ownable {
  address[] public games;

  event eventGameAdded(address game);

  function addGame (address _contractAddress) onlyOwner public {
    require(_contractAddress != address(0));
    games.push(_contractAddress);
    eventGameAdded(_contractAddress);
  }

  function numberOfGames () view public returns (uint256) {
    return games.length;
  }
}
