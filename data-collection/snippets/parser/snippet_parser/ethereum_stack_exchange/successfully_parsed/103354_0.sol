receive() external  payable{
   address _userAddress = msg.sender;
   uint256 _amount = msg.value;
   weth.deposit{value: msg.value}();
   if(_amount>5){
       myFoo1(_userAddress, _amount);
   }
   else{
       myFoo2(_userAddress, _amount);
   }
}
