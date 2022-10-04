  contract calculateTotal{
    
   uint256 balance;

  constructor(uint256 _initialBalance){

       balance=_initialBalance;

       }

  function  purchaseSmth(uint256 _cost) external {

    balance=balance-_cost;

   }

  function getBalance() external view returns(uint256){

     return balance;
   }


}
