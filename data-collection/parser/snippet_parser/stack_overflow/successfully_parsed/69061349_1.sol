function pricing(address _user, uint _rate) public{
    require(approvedUsers[_user] == approvedUsers,"User not in the approvers list");
rate = _rate * (10 ** uint256(decimals()));  }
