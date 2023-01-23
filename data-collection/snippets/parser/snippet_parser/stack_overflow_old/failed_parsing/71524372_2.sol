contract RoleMultiCall {
  function multiCall(
    address[] calldata targets,
    bytes[] calldata encodedFunctions
  ) external returns (bytes[] memory) {
    ...
    for (uint256 i; i < targets.length; i++) {
      (bool success, bytes memory result) = address(targets[i]).call(
        encodedFunctions[i]
      );
      require(success, 'multi call failed');
      results[i] = result;
    }
    return results;
  }
}
