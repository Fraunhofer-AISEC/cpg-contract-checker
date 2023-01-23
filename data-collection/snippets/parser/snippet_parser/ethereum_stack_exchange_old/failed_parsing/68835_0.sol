mapping(address => uint256) investments;
mapping(address => uint256) joined;
mapping(address => uint256) withdrawals;
mapping(address => uint256) withdrawns;


   investments[_customerAddress] = investments[_customerAddress].add(_incomingTronix);
   joined[_customerAddress] = block.timestamp;

   emit Invest(_customerAddress, _incomingTronix);
}
