Contract Need{

   function need(){
      Ext x = Ext ( Extcontractaddress );
      uint256 bal = x.userDailyBalances( msg.sender )[0].dailybalance;

  } 
}
