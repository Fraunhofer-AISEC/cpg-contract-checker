contract MappingsStructExample {

    struct Payment {
        uint amount;
        uint timestamp;
    }  

    struct Balance {
        uint TotalBalance;
        uint NumPayments;
        mapping(uint => Payment) payments;
    }                                                      

    mapping(address => uint) public BalanceReceived;  


    function GetBalance () public view returns (uint) {
      return address(this).balance;   
   }

   function SendMoney() public payable {  
       BalanceReceived[msg.sender] += msg.value;  

       Payment memory payment = Payment(msg.value, block.timestamp);
       *BalanceReceived[msg.sender].payments[BalanceReceived[msg.sender].numPayments] = payment;*
       BalanceReceived[msg.sender].numPayments++;
   }

   function WithdrawMoney(address payable _to, uint _amount) public {
        require(_amount <= BalanceReceived[msg.sender], "not enough funds");
        BalanceReceived[msg.sender] -= _amount;
   }
   function WithdrawAllMoney(address payable _to) public {
        uint balanceToSend = BalanceReceived[msg.sender];     
        BalanceReceived[msg.sender] = 0; 
        
        _to.transfer(address(this).balance);  
