 contract MultiSend {                                                
  function multiSend(address _token, address[] addresses, uint256 amount) public {

for(uint i = 0; i < addresses.length; i++) {
  require(_token.delegatecall(bytes32(keccak256("transfer(address, uint256)")), addresses[i], amount));
}
