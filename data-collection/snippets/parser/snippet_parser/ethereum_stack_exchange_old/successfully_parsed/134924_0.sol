
pragma solidity ^0.8.6;

contract MyFirstContract {
  string public name = "billy";

  function getName() public view returns (string memory) {
    return name;
  }
}
