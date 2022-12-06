

const abi = [
  "constructor(address owner, uint256 initialValue)",
  "function value() view returns (uint)"
];


factory = new ContractFactory(abi, bytecode, signer)


contract = await factory.deploy("ricmoo.eth", 42);
