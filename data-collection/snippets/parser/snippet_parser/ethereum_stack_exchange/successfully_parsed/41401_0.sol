function storeETH() payable public {    
   address(this).transfer(msg.value);
}
