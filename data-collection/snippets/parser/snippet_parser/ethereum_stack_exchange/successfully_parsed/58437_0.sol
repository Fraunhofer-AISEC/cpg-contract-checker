function transferFrom (address _from, address _to, uint256 _value)
public returns (bool success) {
   uint256 spenderAllowance = allowances [_from][msg.sender];
   if (spenderAllowance < _value) return false;
   uint256 fromBalance = accounts [_from];
   if (fromBalance < _value) return false;

   allowances [_from][msg.sender] = safeSub (spenderAllowance, _value);

   if (_value > 0 && _from != _to) {
     accounts [_from] = safeSub (fromBalance, _value);
     accounts [_to] = safeAdd (accounts [_to], _value);
   }
   Transfer (_from, _to, _value);
   return true;
}
