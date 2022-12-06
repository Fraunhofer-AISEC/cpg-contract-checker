interface IA {
  function usersLists(address user) external view returns (bytes32[]);
}

contract A is IA {
  mapping(address => bytes32[]) public override usersLists;
}
