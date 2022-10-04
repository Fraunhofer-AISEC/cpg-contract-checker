function doSomething() external payable {
 if (msg.value < amount){
   emit NotEnoughEth('Please make sure to send correct amount');
   revert();
 }

  
}
