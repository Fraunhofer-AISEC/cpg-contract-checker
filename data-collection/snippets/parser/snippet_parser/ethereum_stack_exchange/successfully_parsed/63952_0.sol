 

function buy() payable public returns (uint amount){
      require(msg.value > 0);

      amount = ((msg.value.mul(TokenPerETHBuy)).mul( 10 ** uint256(decimals))).div(1 ether);
      balanceOf[this] -= amount;                        
      balanceOf[msg.sender] += amount; 
      emit BuyToken(msg.sender,msg.value,amount);
      return amount;
}
