 mapping(uint256 => uint256) public amount;

 function saveAmount(uint256 _id, uint256 _amount) public {
    amount[_id] = _amount;
 }
