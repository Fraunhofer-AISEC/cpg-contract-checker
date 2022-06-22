    
  contract ContractTest{
    
    int totalDeposit;
   
    constructor() public{
      totalDeposit = 0;
    }

    struct User{ 
      int total;
    }

    mapping(address => User) public users;

    function addBalance(int amt) public{
      totalDeposit = totalDeposit + amt;
      users [msg.sender] = User(totalDeposit);
        
    }
}
