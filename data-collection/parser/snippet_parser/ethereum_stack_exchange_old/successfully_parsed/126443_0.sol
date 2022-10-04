  function _transfer(address _from, address _to, uint256 _amount) internal {
    require(balanceOf[_from] >= _amount);
    require(balanceOf[_to] + _amount >= balanceOf[_to]);
    balanceOf[_to] += _amount;
    balanceOf[_from] -= _amount;
    emit Transfer(_from, _to, _amount);
  }
  
  function transfer(address _to, uint256 _amount) public returns(bool) {
    require(msg.sender != address(0) && _to != address(0), "Address cannot be zero");
    _transfer(msg.sender, _to, _amount);
    return true;
  }
