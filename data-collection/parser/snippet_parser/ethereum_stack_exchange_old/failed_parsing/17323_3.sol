bool success;
success = _Token.call(bytes4(sha3 ("allowance(uint256,address)") ), someInteger, someAddress)
if (!success) { throw; 
