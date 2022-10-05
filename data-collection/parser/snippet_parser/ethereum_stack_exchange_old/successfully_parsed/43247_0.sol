function airDrop(address[] recipients,uint amount ) public {

      require(msg.sender == owner);
          require(amount > 0);

         uint256 supposedDropAmount = (recipients.length).mul(amount);
      

      uint256 checkedSupply = dropAmount.add(supposedDropAmount);

      

     require(checkedSupply <= AirdropCap); 

      
       require(now > airdropTime);

      for( uint256 i = 0 ; i < recipients.length ; i++ ) {

           assert(token.mint(recipients[i], amount));
          emit  TokenDrop( recipients[i], amount );
      }
    numDrops = numDrops.add(recipients.length);
    dropAmount = dropAmount.add(recipients.length.mul(amount));
}
