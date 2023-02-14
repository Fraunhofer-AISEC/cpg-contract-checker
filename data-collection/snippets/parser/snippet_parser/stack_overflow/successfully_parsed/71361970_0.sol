bytes memory bytecode = type(UniswapV2Pair).creationCode;
bytes32 salt = keccak256(abi.encodePacked(token0, token1));
assembly {
  pair := create2(0, add(bytecode, 32), mload(bytecode), salt)
}
