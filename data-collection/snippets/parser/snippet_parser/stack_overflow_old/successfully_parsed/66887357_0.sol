pragma solidity >=0.5.1 <0.6.0;
contract HelloWorld {

    mapping(address => uint) public balance;
    uint public countOfInvestors = 0;
    mapping(address => uint) public time;
    event Invest(address investor, uint256 amount);
    
     function deposit() private {
        if (msg.value > 0) {
            if (balance[msg.sender] == 0) {
                countOfInvestors += 1;
            }
            balance[msg.sender] = msg.value;
            time[msg.sender] = now;
            emit Invest(msg.sender, msg.value);
        }
    }
   function() external payable {
       deposit();
   }
}
