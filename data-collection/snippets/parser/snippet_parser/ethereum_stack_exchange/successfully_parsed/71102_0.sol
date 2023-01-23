contract foster{
    vulnerable v = new vulnerable();
    attacker a = new attacker(address(v));

     constructor() public payable{

        
        
     }

     function action() public payable{
         a.deposit(address(v));     
         v.addNominee(address(a));
     }

     function getTargetBalance() public view returns(uint256, uint256){
        return (address(v).balance , address(this).balance);
    }

     function attack() public payable{
         v.transact();
     }
}

