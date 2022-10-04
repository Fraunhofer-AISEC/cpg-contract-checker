contract Bank {


    address public admin;

    constructor() {
       admin = msg.sender;
    }

   mapping (address => uint) balance;
   mapping (address => bool) AccountActive;

    function closeAccount() public  payable{
    AccountActive[msg.sender] = false;
        
        payable(admin).transfer(balance[msg.sender]);
        
    }

    function viewbalance() public view returns(uint) {
        return balance[msg.sender];
        
    }}
