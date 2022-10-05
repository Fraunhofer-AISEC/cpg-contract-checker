 function transfer(address _to, uint _value, bytes memory _data, string memory _custom_fallback) public returns (bool success) {

   if(isContract(_to)) {
       if (balanceOf(msg.sender) < _value) revert();
       balances[msg.sender] = safeSub(balanceOf(msg.sender), _value);
       balances[_to] = safeAdd(balanceOf(_to), _value);
       assert(_to.call.value(0)(bytes4(keccak256(_custom_fallback)), msg.sender, _value, _data));
       emit Transfer(msg.sender, _to, _value, _data);
    return true;
   }
   else {
       return transferToAddress(_to, _value, _data);
   }
}
