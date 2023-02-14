uint16 id = 42;
address creator = '0x...';
uint256 amount = 1337;

bytes memory message = abi.encodePacked(id, creator, amount);
