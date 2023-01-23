Typeerror: member balance not found or not visible argument-dependent lookup in contractLottery. Use "address(this).balance" to access this address member.players[index].transfer(this.balance);

TypeError: Wrong argument count for function call: 3 arguments given but 
expected 1. This function requires a single bytes argument. Use 
abi.encodePacked(...) to obtain the pre-0.5.0 behaviour or abi.encode(...) 
to use ABI encoding.
return uint(keccak256(block.difficulty,now,players));
