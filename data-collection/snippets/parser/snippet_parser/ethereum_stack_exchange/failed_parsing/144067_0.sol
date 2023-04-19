Contract binaryMLM {

     mapping(address => uint256) public balances;
     address[] private addresses;
     event Withdrawal(address indexed user, uint256 amount);


function Withdraw() public {
    require(block.timestamp >= lastWithdrawTime + 24 hours, "You can call this function only once every 24 hours");
    lastWithdrawTime = block.timestamp;
    for (uint256 i = 0; i < addresses.length; i++) {
        address _address = addresses[i];
        if (balances[_address] > 0) {
            IERC20(address(this)).transfer(_address, balances[_address]);
            emit Withdrawal(_address, balances[_address]);
            totalRewardPayment += balances[_address];
            balances[_address] = 0;
      }
    }
  }
}
