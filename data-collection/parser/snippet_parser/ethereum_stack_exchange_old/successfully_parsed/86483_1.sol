contract RentalCompleting is Transaction{
function promiseRentalCompleting() public
         atCFact(C_facts.Requested)
         returns (address){
             DepositPaying depositPaying = new DepositPaying(address(this));
             return address(depositPaying);
         }
}