
pragma solidity ^0.8.13;

contract Test2 {
    mapping(address => uint) public totalETHSpent;

    function getEThSpentByAddress(address[] calldata users) public view returns(uint256[] memory) {
      uint _length = users.length;
      uint[] memory results = new uint[](_length);

      for(uint i = 0; i < _length; i++) {
          results[i] = totalETHSpent[users[i]];
      }

      return results;
  }
}
