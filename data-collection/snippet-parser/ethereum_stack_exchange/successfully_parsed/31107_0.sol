   function transfer(address _from, address _to, uint _amount
 ) internal returns(bool) {
       
      require((_to != 0) && (_to != address(this)));
 }
