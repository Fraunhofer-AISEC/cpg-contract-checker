interface IA {
  
  function usersLists(address user, uint256 index) external view returns (bytes32);
  
  function getUsersLists(address user) external view returns (bytes32[] memory);
}

contract A is IA {
  mapping(address => bytes32[]) public override usersLists;

  function getUsersLists(address user) external override view returns (bytes32[] memory) {
        return usersLists[user];
  }
}
