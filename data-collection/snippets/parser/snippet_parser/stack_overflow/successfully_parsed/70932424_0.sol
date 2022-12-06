address public admin;

    constructor() {
       admin = msg.sender;
    }

   
   mapping (address => uint) balance;
   mapping (address => bool) AccountActive;

  function deposit() public payable {
     balance[msg.sender] += msg.value;
      
  }
