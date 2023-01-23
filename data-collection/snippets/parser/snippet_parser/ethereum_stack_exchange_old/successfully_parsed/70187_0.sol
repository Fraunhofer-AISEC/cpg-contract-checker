function approveAndCall (IERC20 _token, address _to, uint256 _value, bytes memory _data)
public payable returns (bytes memory _returnData) {
  require (_token.approve (_to, _value));
  bool success;
  (success, _returnData) = _to.call.value (msg.value) (_data); 
  require (success);
  require (_token.approve (_to, 0)); 
}
