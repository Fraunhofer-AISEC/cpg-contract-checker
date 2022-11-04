const abi = [
  "constructor(address owner, uint256 initialValue)",
  "function value() view returns (uint)"
];

contract = await factory.deploy("ricmoo.eth", 42);
