contract DepositPaying is Transaction {
        RentalCompleting rentalCompleting;
        constructor(address _rentalCompleting) public{
           rentalCompleting = RentalCompleting(_rentalCompleting);}
        function acceptDepositPaying() public
         atCFact(C_facts.Declared)
         transitionNext(true)
         returns (address)
         {
             require(da_invoiceAmount == pm_invoiceAmount);
             rentalCompleting.c_fact() = C_facts(uint(c_fact) + 1);    <=ERROR HERE=>
             return address(rentalCompleting);
         } 
